/*
 * Copyright 2024 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <android-base/logging.h>
#include <android-base/properties.h>
#include <android_runtime/AndroidRuntime.h>
// #include <android_view_InputDevice.h>
#include <jni_wrappers.h>

#include <clocale>
#include <sstream>
#include <unordered_map>
#include <vector>

using namespace std;

static JavaVM* javaVM;
static jclass bridge;
static jclass layoutLog;
static jmethodID getLogId;
static jmethodID logMethodId;

namespace android {

#if 0
static vector<string> parseCsv(const string& csvString) {
    vector<string> result;
    istringstream stream(csvString);
    string segment;
    while (getline(stream, segment, ',')) {
        result.push_back(segment);
    }
    return result;
}

// Creates an array of InputDevice from key character map files
static void init_keyboard(const vector<string>& keyboardPaths) {
    JNIEnv* env = AndroidRuntime::getJNIEnv();
    jclass inputDevice = FindClassOrDie(env, "android/view/InputDevice");
    jobjectArray inputDevicesArray =
            env->NewObjectArray(keyboardPaths.size(), inputDevice, nullptr);
    int keyboardId = 1;

    for (const string& path : keyboardPaths) {
        base::Result<std::shared_ptr<KeyCharacterMap>> charMap =
                KeyCharacterMap::load(path, KeyCharacterMap::Format::BASE);

        InputDeviceInfo info = InputDeviceInfo();
        info.initialize(keyboardId, 0, 0, InputDeviceIdentifier(),
                        "keyboard " + std::to_string(keyboardId), true, false,
                        ui::LogicalDisplayId::DEFAULT);
        info.setKeyboardType(AINPUT_KEYBOARD_TYPE_ALPHABETIC);
        info.setKeyCharacterMap(*charMap);

        jobject inputDeviceObj = android_view_InputDevice_create(env, info);
        if (inputDeviceObj) {
            env->SetObjectArrayElement(inputDevicesArray, keyboardId - 1, inputDeviceObj);
            env->DeleteLocalRef(inputDeviceObj);
        }
        keyboardId++;
    }

    if (bridge == nullptr) {
        bridge = FindClassOrDie(env, "com/android/layoutlib/bridge/Bridge");
        bridge = MakeGlobalRefOrDie(env, bridge);
    }
    jmethodID setInputManager = GetStaticMethodIDOrDie(env, bridge, "setInputManager",
                                                       "([Landroid/view/InputDevice;)V");
    env->CallStaticVoidMethod(bridge, setInputManager, inputDevicesArray);
    env->DeleteLocalRef(inputDevicesArray);
}
#endif

void LayoutlibLogger(base::LogId, base::LogSeverity severity, const char* tag, const char* file,
                     unsigned int line, const char* message) {
    JNIEnv* env = AndroidRuntime::getJNIEnv();
    jint logPrio = severity;
    jstring tagString = env->NewStringUTF(tag);
    jstring messageString = env->NewStringUTF(message);

    jobject bridgeLog = env->CallStaticObjectMethod(bridge, getLogId);

    env->CallVoidMethod(bridgeLog, logMethodId, logPrio, tagString, messageString);

    env->DeleteLocalRef(tagString);
    env->DeleteLocalRef(messageString);
    env->DeleteLocalRef(bridgeLog);
}

void LayoutlibAborter(const char* abort_message) {
    // Layoutlib should not call abort() as it would terminate Studio.
    // Throw an exception back to Java instead.
    JNIEnv* env = AndroidRuntime::getJNIEnv();
    jniThrowRuntimeException(env, "The Android framework has encountered a fatal error");
}

class LayoutlibRuntime : public AndroidRuntime {
public:
    LayoutlibRuntime() : AndroidRuntime(nullptr, 0) {}

    void onJavaVmCreated(JavaVM* vm) {
        AndroidRuntime::onJavaVmCreated(vm);
    }

    void onVmCreated(JNIEnv* env) override {
        AndroidRuntime::onVmCreated(env);
        android::base::SetLogger(LayoutlibLogger);
        android::base::SetAborter(LayoutlibAborter);
    }

    void onStarted() override {
        JNIEnv* env = AndroidRuntime::getJNIEnv();

        jmethodID setSystemPropertiesMethod =
                GetStaticMethodIDOrDie(env, bridge, "setSystemProperties", "()V");
        env->CallStaticVoidMethod(bridge, setSystemPropertiesMethod);
#if 0
        string keyboard_paths = base::GetProperty("ro.keyboard.paths", "");
        vector<string> keyboardPaths = parseCsv(keyboard_paths);
        init_keyboard(keyboardPaths);
#endif
        AndroidRuntime::getRuntime()->onStarted();
    }
};

} // namespace android

using namespace android;

JNIEXPORT jint JNI_OnLoad(JavaVM* vm, void*) {
    javaVM = vm;
    JNIEnv* env = nullptr;
    if (vm->GetEnv(reinterpret_cast<void**>(&env), JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }

    layoutLog = FindClassOrDie(env, "com/android/ide/common/rendering/api/ILayoutLog");
    layoutLog = MakeGlobalRefOrDie(env, layoutLog);
    logMethodId = GetMethodIDOrDie(env, layoutLog, "logAndroidFramework",
                                   "(ILjava/lang/String;Ljava/lang/String;)V");
    bridge = FindClassOrDie(env, "com/android/layoutlib/bridge/Bridge");
    bridge = MakeGlobalRefOrDie(env, bridge);
    getLogId = GetStaticMethodIDOrDie(env, bridge, "getLog",
                                      "()Lcom/android/ide/common/rendering/api/ILayoutLog;");

    Vector<String8> args;
    LayoutlibRuntime runtime;

    runtime.onJavaVmCreated(javaVM);
    runtime.onVmCreated(env);
    runtime.start("LayoutlibRuntime", args, false);

    return JNI_VERSION_1_6;
}

JNIEXPORT void JNI_OnUnload(JavaVM* vm, void*) {
    JNIEnv* env = nullptr;
    vm->GetEnv(reinterpret_cast<void**>(&env), JNI_VERSION_1_6);
    env->DeleteGlobalRef(bridge);
    env->DeleteGlobalRef(layoutLog);
}
