#!/bin/bash

# Android Studio ARM64 一键编译脚本
# 基于 Android Studio 2024.3.2 编译说明

set -e

# 配置变量
export BUILD_BASE="$HOME/Studio"
export STUDIO_VERSION="2024.3.2"
export TOOLS_DIR="$BUILD_BASE/build-tools"
export STUDIO_DIR="$BUILD_BASE/studio-$STUDIO_VERSION"

DEFAULT_BUILD_TOOL="Clang"

# 颜色输出函数
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# 检查环境
check_environment() {
    log_info "检查编译环境..."
    
    # 检查架构
    if [ "$(uname -m)" != "aarch64" ]; then
        log_warning "当前架构不是 aarch64，建议在 ARM64 机器上编译"
    fi
    
    # 检查磁盘空间
    local available_space=$(df /home | awk 'NR==2 {print $4}')
    if [ "$available_space" -lt 300000000 ]; then
        log_error "磁盘空间不足，需要至少 300GB 可用空间"
        exit 1
    fi
    
    # 检查内存
    local total_mem=$(free -g | awk 'NR==2 {print $2}')
    if [ "$total_mem" -lt 12 ]; then
        log_warning "内存可能不足，建议 16GB 或以上内存"
    fi
}

# 编译 Python 3.11
build_python() {
    log_info "编译 Python 3.11..."
    
    cd "$TOOLS_DIR"
    
    if [ ! -d "python3.11" ]; then
        # 下载 Python 源码
        wget https://github.com/python/cpython/archive/refs/tags/v3.11.4.tar.gz
        tar -xzf v3.11.4.tar.gz
        rm v3.11.4.tar.gz
        cd cpython-3.11.4
        
        # 配置和编译
        ./configure --prefix="$TOOLS_DIR/python3.11" --enable-optimizations --without-static-libpython --enable-shared
        make -j$(nproc)
        make altinstall
        
        # 创建软链接
        cd "$TOOLS_DIR/python3.11/bin"
        ln -sf 2to3-3.11 2to3
        ln -sf idle3.11 idle3
        ln -sf pip3.11 pip3
        ln -sf pydoc3.11 pydoc3
        ln -sf python3.11 python3
        ln -sf python3.11-config python3-config
        
        # 设置环境变量
        echo "export PATH=$TOOLS_DIR/python3.11/bin:\$PATH" >> ~/.bashrc
        echo "export LD_LIBRARY_PATH=$TOOLS_DIR/python3.11/lib:\$LD_LIBRARY_PATH" >> ~/.bashrc

        log_success "Python 3.11 编译完成"
    else
        log_success "Python 3.11 已编译完成"
    fi
    
    export PATH=$TOOLS_DIR/python3.11/bin:$PATH
    export LD_LIBRARY_PATH=$TOOLS_DIR/python3.11/lib:$LD_LIBRARY_PATH
}

# 下载 Android Studio patches
download_studio_patch() {
    log_info "下载 Android Studio Patches ..."
    
    cd "$TOOLS_DIR"
    
    if [ ! -d "android_studio-patches" ]; then
        # 下载补丁
        git clone https://github.com/openfde/android_studio-patches.git
    else
        log_success "Android Studio Patches 已下载完成"
    fi
}

# 检查并编译 CMake
build_cmake() {
    log_info "检查并编译 CMake..."
    
    # 检查当前 CMake 版本
    if command -v cmake &> /dev/null; then
        local current_version=$(cmake --version | head -n1 | awk '{print $3}')
        log_info "当前 CMake 版本: $current_version"
        
        # 比较版本号
        if [ "$(printf '%s\n' "3.20.0" "$current_version" | sort -V | head -n1)" = "3.20.0" ]; then
            log_success "CMake 版本已满足要求"
            return 0
        fi
    fi
    
    log_info "CMake 版本过低或未安装，开始编译 CMake 3.25.0..."
    
    cd "$TOOLS_DIR"
    
    # 下载 CMake 3.25.0
    if [ ! -d "cmake-3.25.0" ]; then
        wget https://cmake.org/files/v3.25/cmake-3.25.0.tar.gz
        tar -xzf cmake-3.25.0.tar.gz
        rm cmake-3.25.0.tar.gz
    fi
    
    cd cmake-3.25.0
    # 配置和编译
    ./bootstrap --prefix="$TOOLS_DIR/cmake-3.25.0"
    make -j$(nproc)
    make install

    # 设置环境变量
    export PATH=$TOOLS_DIR/cmake-3.25.0/bin:$PATH
    echo "export PATH=$TOOLS_DIR/cmake-3.25.0/bin:\$PATH" >> ~/.bashrc

    log_success "CMake 3.25.0 编译完成"
}

# 编译 Clang 工具链
build_clang() {
    log_info "编译 Clang 工具链..."
    
    cd "$TOOLS_DIR"
    
    if [ ! -d "clang-r536225" ]; then
        mkdir -p clang-r536225-project
        cd clang-r536225-project
        
        # 下载源码
        if [ ! -d "toolchain-utils" ]; then
            git clone https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/platform/external/toolchain-utils --depth 1
        fi
        if [ ! -d "binutils" ]; then
            git clone https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/toolchain/binutils --depth 1
        fi
        if [ ! -d "llvm_android" ]; then
            git clone https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/toolchain/llvm_android --depth 1
        fi
        if [ ! -d "llvm-project" ]; then
            git clone https://mirrors.tuna.tsinghua.edu.cn/git/AOSP/toolchain/llvm-project --depth 1
        fi

        cd $TOOLS_DIR/clang-r536225-project
        # 拷贝编译脚本并修改安装路径
        if [ ! -d "build-arm64-aosp-clang.sh" ]; then
            cp $TOOLS_DIR/android_studio-patches/clang-r536225-build-sh/build-arm64-aosp-clang.sh .
            sed -i "s|/path/to/install|$TOOLS_DIR|g" build-arm64-aosp-clang.sh
            chmod +x build-arm64-aosp-clang.sh
        fi

        cd clang-r536225-project
        ./build-arm64-aosp-clang.sh

        log_success "clang-r536225 编译完成"
    else
        log_success "clang-r536225 已编译完成"
    fi
}

# 编译 libedit
build_libedit() {
    log_info "编译 libedit..."
    
    cd "$TOOLS_DIR"
    
    if [ ! -d "libedit" ]; then
        git clone https://aosp.tuna.tsinghua.edu.cn/platform/external/libedit
        cd libedit
        git checkout 892b8b381ae82ac3184900d989a516854d8b1197
        
        ./configure --prefix="$TOOLS_DIR/clang-r536225"
        make -j$(nproc)
        make install
        
        log_success "libedit 编译完成"
    else
        log_success "libedit 已编译完成"
    fi
}

# 编译 libxml2
build_libxml2() {
    log_info "编译 libxml2..."
    
    cd "$TOOLS_DIR"
    
    if [ ! -d "libxml2" ]; then
        git clone https://aosp.tuna.tsinghua.edu.cn/platform/external/libxml2
        cd libxml2
        git checkout 6ba1428801b9083ecd5b00fee129a7274ee9e5a1
        sed -i "s|1.16.3|1.16.1|g" configure.ac
        
        ./autogen.sh --without-python
        ./configure --prefix="$TOOLS_DIR/clang-r536225" --with-python="$TOOLS_DIR/libxml2/python" --with-zlib="$WORK_DIR/output" --without-python
        make -j$(nproc)
        make install
        
        log_success "libxml2 编译完成"
    else
        log_success "libxml2 已编译完成"
    fi
}

# 编译 NDK
build_ndk() {
    log_info "编译 NDK..."
    
    cd "$TOOLS_DIR"
    mkdir -p ndk-build
    cd ndk-build
    
    # 下载 llvm-toolchain 代码
    if [ ! -d "llvm-toolchain" ]; then
        mkdir -p llvm-toolchain
        cd llvm-toolchain
        repo init -u https://aosp.tuna.tsinghua.edu.cn/platform/manifest -b llvm-toolchain
        cp $TOOLS_DIR/android_studio-patches/ndk-build-patch/default.xml $TOOLS_DIR/ndk-build/llvm-toolchain/.repo/manifests/default.xml
        repo sync -j4
    fi

    cd $TOOLS_DIR/ndk-build
    # 下载 ndk-aarch64-linux 补丁
    if [ ! -d "ndk-aarch64-linux" ]; then
        git clone https://github.com/SnowNF/ndk-aarch64-linux.git
        
        # 应用补丁
        cd llvm-toolchain/toolchain/llvm_android
        mv patches ../
        rm -rf *
        cp -rf ../../../ndk-aarch64-linux/* .
        rm -rf patches
        mv ../patches .
    fi
    
    # 开始编译
    cd $TOOLS_DIR/ndk-build/llvm-toolchain
    if [ ! -d "out" ]; then
        python3 toolchain/llvm_android/build.py --no-build windows --skip-tests --single-stage --no-musl
        log_success "NDK 编译完成"
    else
        log_success "NDK 已编译完成"
    fi
}

# 拷贝NDK文件到Studio Sdk中
copy_ndk_to_sdk() {

    cd "$TOOLS_DIR"
    if [ ! -d "Sdk" ]; then
        log_info "下载 Sdk..."
        git clone https://gitee.com/pngcui/studio_sdk.git
        mv studio_sdk Sdk
        log_success "Sdk 下载完成"
    fi

    cd $TOOLS_DIR/Sdk
    if [ ! -d "cmake" ]; then
        log_info "拷贝 cmake 到 Sdk 目录..."
        mkdir -p cmake/3.25.0
        cp -rf $TOOLS_DIR/cmake-3.25.0/bin cmake/3.25.0/
        cp -rf $TOOLS_DIR/cmake-3.25.0/doc cmake/3.25.0/
        cp -rf $TOOLS_DIR/cmake-3.25.0/share cmake/3.25.0/
        
        log_success "cmake 拷贝完成"
    fi

    cd $TOOLS_DIR/Sdk/
    if [ ! -d "ndk" ]; then
        log_info "拷贝 ndk 到 Sdk 目录..."
        mkdir ndk
        cd ndk
        wget https://dl.google.com/android/repository/android-ndk-r27-linux.zip
        unzip android-ndk-r27-linux.zip
        mv android-ndk-r27 27.0.12077973
        rm android-ndk-r27-linux.zip
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/bin/* \
                $TOOLS_DIR/Sdk/ndk/27.0.12077973/toolchains/llvm/prebuilt/linux-x86_64/bin/

        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/include/* \
                $TOOLS_DIR/Sdk/ndk/27.0.12077973/toolchains/llvm/prebuilt/linux-x86_64/include/

        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/libexec/* \
                $TOOLS_DIR/Sdk/ndk/27.0.12077973/toolchains/llvm/prebuilt/linux-x86_64/libexec/

        cp $TOOLS_DIR/android_studio-patches/ndk-build-patch/build/tools/ndk_bin_common.sh \
                $TOOLS_DIR/Sdk/ndk/27.0.12077973/build/tools/
        log_success "ndk-r27 拷贝完成"
    fi

    cd $TOOLS_DIR/Sdk/ndk/27.0.12077973/toolchains/llvm/prebuilt/linux-x86_64/lib
    if [ ! -d "aarch64-unknown-linux-gnu" ]; then
        log_info "拷贝 llvm 到 Sdk 目录..."
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/arm64-unknown-linux-gnu ./aarch64-unknown-linux-gnu
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/libbolt_rt_instr.a ./
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/libedit.so.0 ./
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/liblldb.so ./
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/liblldbIntelFeatures.so ./
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/libRemarks.so* ./
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/libxml2.so* ./
        cp -rf $TOOLS_DIR/ndk-build/llvm-toolchain/out/stage2-install/lib/LLVMPolly.so ./
        rm libc++*
        ln -s aarch64-unknown-linux-gnu/libc++.a libc++.a
        ln -s aarch64-unknown-linux-gnu/libc++abi.a libc++abi.a
        ln -s aarch64-unknown-linux-gnu/libc++abi.so libc++abi.so
        ln -s aarch64-unknown-linux-gnu/libc++abi.so.1 libc++abi.so.1
        ln -s aarch64-unknown-linux-gnu/libc++.so libc++.so
        ln -s aarch64-unknown-linux-gnu/libc++.so.1 libc++.so.1

        log_success "llvm 拷贝完成"
    fi

    cd $TOOLS_DIR/Sdk/ndk/27.0.12077973/toolchains/llvm/prebuilt/linux-x86_64
    if [ ! -f "python3/bin/pip3" ]; then
        log_info "拷贝 python3 到 Sdk 目录..."

        rm -rf python3
        cp -rf $TOOLS_DIR/python3.11 python3
    
        log_success "python3 拷贝完成"
    fi
}

# 编译 platform-tools
build_platform_tools() {
    log_info "编译 platform-tools..."
    
    cd "$TOOLS_DIR"
    if [ ! -d "android-sdk-tools" ]; then
        git clone https://github.com/lzhiyong/android-sdk-tools.git
        # checkout到指定版本
        cd android-sdk-tools
        git checkout 50713285d4de73dd36735928217523817ad16988
        cd ..
        # 合入android-sdk-tools仓库补丁
        cp android_studio-patches/platform-tools-patch/*.patch android-sdk-tools/
        cd android-sdk-tools/
        git am *.patch
        rm *.patch
        cd ..
    fi

    cd $TOOLS_DIR/android-sdk-tools
    # 下载 34.0.0 版本
    if [ ! -d "src" ]; then
        pip3 install requests
        python3 get_source.py --tags platform-tools-34.0.0
        # 合入src下各仓库的补丁
        cd $TOOLS_DIR/android_studio-patches/platform-tools-patch/adb-34.0.0-patch
        ./apply_patch.sh $TOOLS_DIR/android-sdk-tools/src
    fi
    
    # 编译 protobuf
    cd $TOOLS_DIR/android-sdk-tools/src/protobuf
    if [ ! -d "build" ]; then
        mkdir -p build
        cd build
        cmake -GNinja -Dprotobuf_BUILD_TESTS=OFF ..
        ninja -j8
        cd ..
        log_success "protobuf 编译完成"
    fi

    cd $TOOLS_DIR/android-sdk-tools
    # 编译 adb/aapt等工具
    if [ ! -d "build/aarch64" ]; then
        llvm_libpath=$(ls -d /usr/lib/llvm-*/lib)
        python3 build.py \
            --ndk="$TOOLS_DIR/Sdk/ndk/27.0.12077973/" \
            --abi=arm64-v8a \
            --libpath=$llvm_libpath \
            --build=build/aarch64 \
            --protoc="$TOOLS_DIR/android-sdk-tools/src/protobuf/build/protoc-3.21.7.0"
        
        log_success "platform-tools 编译完成"
    else
        log_success "platform-tools 已编译完成"
    fi
}

# 拷贝platform_tools文件到Studio Sdk中
copy_platform_tools_to_sdk() {
  
    cd $TOOLS_DIR/Sdk/build-tools/34.0.0
    if [ ! -f "aapt" ]; then
        log_info "拷贝 build-tools 到 Sdk 目录..."

        cp -rf $TOOLS_DIR/android-sdk-tools/build/aarch64/bin/build-tools/* ./
        cp -rf $TOOLS_DIR/android-sdk-tools/build/aarch64/bin/build-tools/aapt2 ./../

        log_success "build-tools 拷贝完成"
    fi

    cd $TOOLS_DIR/Sdk/platform-tools
    if [ ! -f "adb" ]; then
        log_info "拷贝 platform-tools 到 Sdk 目录..."
        cp -rf $TOOLS_DIR/android-sdk-tools/build/aarch64/bin/platform-tools/* ./

        log_success "platform-tools 拷贝完成"
    fi
}

# 下载 Android Studio 源码
download_studio_source() {
    log_info "下载 Android Studio 源码..."
    
    cd "$BUILD_BASE"
    
    if [ ! -d "studio-$STUDIO_VERSION" ]; then
        mkdir -p studio-$STUDIO_VERSION
        cd studio-$STUDIO_VERSION
        
        # 使用清华源下载
        repo init -u https://aosp.tuna.tsinghua.edu.cn/platform/manifest -b studio-$STUDIO_VERSION
        repo sync -c -j4

        log_success "Android Studio 源码下载完成"
    else
        log_success "Android Studio 源码已下载"
    fi
}

# 应用补丁
apply_studio_patches() {
    log_info "应用 Android Studio 补丁..."
    
    cd "$STUDIO_DIR"
    if [ ! -f "tools/replace_intellij.sh" ]; then
        cd "$TOOLS_DIR/android_studio-patches/studio-$STUDIO_VERSION-patch"
        chmod +x apply_patch.sh
        ./apply_patch.sh "$STUDIO_DIR"

        log_success "Android Studio 补丁合并成功"
    else
        log_success "Android Studio 补丁已合并"
    fi
}

# 准备编译工具链
prepare_toolchains() {
    log_info "准备 Studio 编译工具链..."

    # 下载 ARM64 Jbr 21
    cd "$STUDIO_DIR/prebuilts/studio/jdk/jbr-next"
    if [ ! -f "linux/arm64.flag" ]; then
        wget -O jbr21.tar.gz https://cache-redirector.jetbrains.com/intellij-jbr/jbr_ft-21.0.6-linux-aarch64-b895.109.tar.gz
        tar -xzf jbr21.tar.gz
        cp -rf jbr*/* linux/
        rm jbr21.tar.gz
        rm -rf jbr*
        touch $STUDIO_DIR/prebuilts/studio/jdk/jbr-next/linux/arm64.flag

        log_success "替换 jbr-next 完成"
    fi

    # 下载 ARM64 JbrSdk 21
    cd "$STUDIO_DIR/prebuilts/studio/jdk/jbrjdk-next"
    if [ ! -f "linux/arm64.flag" ]; then
        wget -O jbrsdk21.tar.gz https://cache-redirector.jetbrains.com/intellij-jbr/jbrsdk_ft-21.0.6-linux-aarch64-b895.109.tar.gz
        tar -xzf jbrsdk21.tar.gz
        cp -rf jbrsdk*/* linux/
        rm jbrsdk21.tar.gz
        rm -rf jbrsdk*
        touch $STUDIO_DIR/prebuilts/studio/jdk/jbrjdk-next/linux/arm64.flag

        log_success "替换 jbrjdk-next 完成"
    fi

    # 下载 ARM64 JDK 17
    cd "$STUDIO_DIR/prebuilts/studio/jdk/jdk17"
    if [ ! -f "linux/arm64.flag" ]; then
        wget -O jdk17.tar.gz https://mirrors.tuna.tsinghua.edu.cn/Adoptium/17/jdk/aarch64/linux/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.16_8.tar.gz
        tar -xzf jdk17.tar.gz
        cp -rf jdk*/* linux/
        rm jdk17.tar.gz
        rm -rf jdk*
        touch $STUDIO_DIR/prebuilts/studio/jdk/jdk17/linux/arm64.flag
    
        log_success "替换 jdk17 完成"
    fi
    
    # 下载 ARM64 JDK 8
    cd "$STUDIO_DIR/prebuilts/studio/jdk/jdk8"
    if [ ! -f "linux/arm64.flag" ]; then
        mkdir -p jdk8/linux
        wget -O jdk8.tar.gz https://mirrors.tuna.tsinghua.edu.cn/Adoptium/8/jdk/aarch64/linux/OpenJDK8U-jdk_aarch64_linux_hotspot_8u462b08.tar.gz
        tar -xzf jdk8.tar.gz
        cp -rf jdk*/* linux/
        rm jdk8.tar.gz
        rm -rf jdk*
        touch $STUDIO_DIR/prebuilts/studio/jdk/jdk8/linux/arm64.flag

        log_success "替换 jdk8 完成"
    fi

    # 复制 Clang 工具链
    cd "$STUDIO_DIR/prebuilts/clang/host/linux-x86"
    if [ "$DEFAULT_BUILD_TOOL" != "PhyCC" ];then
        if [ -d "$TOOLS_DIR/clang-r536225" ]; then
            if [ ! -f "$STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/clang_arm64.flag" ]; then
                cp -rf $TOOLS_DIR/clang-r536225/* $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/
                cp $TOOLS_DIR/android_studio-patches/studio-2024.3.2-patch/build/bazel/clang_19.BUILD \
                    $STUDIO_DIR/build/bazel/toolchains/cc/linux_clang/clang.BUILD
                cd $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/lib
                rm libc++.modules.json
                ln -s aarch64-unknown-linux-gnu/libc++.modules.json libc++.modules.json
                rm libc++.so
                ln -s aarch64-unknown-linux-gnu/libc++.so libc++.so
                rm libc++.so.1
                ln -s aarch64-unknown-linux-gnu/libc++.so.1 libc++.so.1
                rm libc++.a
                ln -s aarch64-unknown-linux-gnu/libc++.a libc++.a
                rm libc++abi.a
                ln -s aarch64-unknown-linux-gnu/libc++abi.a libc++abi.a
                rm libunwind.so
                ln -s aarch64-unknown-linux-gnu/libunwind.so libunwind.so
                if [ -f "$STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/phycc_arm64.flag" ];then
                    rm $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/phycc_arm64.flag
                fi
                touch $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/clang_arm64.flag

                log_success "替换 clang 完成"
            fi
        fi
    else
        if [ -d "$PHYCC_PATH" ]; then
            if [ ! -f "$STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/phycc_arm64.flag" ]; then
                cp -rf $PHYCC_PATH/bin $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/
                cp -rf $PHYCC_PATH/lib $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/
                cp -rf $PHYCC_PATH/libexec $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/
                cp -rf $PHYCC_PATH/share $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/
                # cp -rf $PHYCC_PATH/* $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/

                cp $TOOLS_DIR/android_studio-patches/studio-2024.3.2-patch/build/bazel/clang_17.BUILD \
                    $STUDIO_DIR/build/bazel/toolchains/cc/linux_clang/clang.BUILD

                cp -rf $TOOLS_DIR/clang-r536225/lib/libxml* $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/lib/
                cp -rf $TOOLS_DIR/clang-r536225/lib/libedit* $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/lib/

                cd $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/lib
                rm libc++.modules.json
                ln -s aarch64-unknown-linux-gnu/libc++.modules.json libc++.modules.json
                rm libc++.so
                ln -s aarch64-unknown-linux-gnu/libc++.so libc++.so
                rm libc++.so.1
                ln -s aarch64-unknown-linux-gnu/libc++.so.1 libc++.so.1
                rm libc++.a
                ln -s aarch64-unknown-linux-gnu/libc++.a libc++.a
                rm libc++abi.a
                ln -s aarch64-unknown-linux-gnu/libc++abi.a libc++abi.a
                rm libunwind.so
                ln -s aarch64-unknown-linux-gnu/libunwind.so libunwind.so
                if [ -f "$STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/clang_arm64.flag" ];then
                    rm $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/clang_arm64.flag
                fi
                touch $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/phycc_arm64.flag

                log_success "替换 clang(phycc) 完成"
            fi
        fi
    fi
    
    # 复制 Python
    if [ -d "$TOOLS_DIR/python3.11" ]; then
        if [ ! -f "$STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/python3/arm64.flag" ]; then
            cp -rf $TOOLS_DIR/python3.11/* $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/python3/
            touch $STUDIO_DIR/prebuilts/clang/host/linux-x86/clang-r536225/python3/arm64.flag
        fi
        if [ ! -f "$STUDIO_DIR/prebuilts/python/linux-x86/arm64.flag" ]; then
            cp -rf $TOOLS_DIR/python3.11/* $STUDIO_DIR/prebuilts/python/linux-x86/
            touch $STUDIO_DIR/prebuilts/python/linux-x86/arm64.flag

            log_success "替换 python 完成"
        fi
    fi
    
    # 复制 gcc 工具
    if [ ! -f "$STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/arm64.flag" ]; then
        cp -rf /usr/lib/gcc/aarch64-linux-gnu \
            $STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/lib/gcc/
        
        cp -rf /usr/lib/gcc/aarch64-linux-gnu/*/* \
            $STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/lib/gcc/x86_64-linux/4.8.3/

        cp -rf /usr/include/* \
            $STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/sysroot/usr/include/

        cp -rf /usr/lib/aarch64-linux-gnu/* \
            $STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/sysroot/usr/lib/
        
        # 替换libc.so
        cp $TOOLS_DIR/android_studio-patches/studio-2024.3.2-patch/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/sysroot/usr/lib/libc.so \
            $STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/sysroot/usr/lib/

        gcc_lib_path=$(ls -d /usr/lib/gcc/aarch64-linux-gnu/*/)
        cp -rf $gcc_lib_path/* \
            $STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/lib/gcc/x86_64-linux/4.8.3
        
        touch $STUDIO_DIR/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/arm64.flag
        
        log_success "替换 glic 完成"
    fi
    log_success " Studio 编译工具链 已准备完成"
}

# 编译 Android Studio
build_android_studio() {
    log_info "开始编译 Android Studio..."

    cd "$STUDIO_DIR"
    
    # 第一步：编译android studio基础包
    log_info "步骤 1: 编译android studio基础包"
    ./tools/idea/build_studio.sh
    
    # 第二步：编译 artifacts 组件
    log_info "步骤 2: 编译 artifacts 组件"
    if [ ! -d "$STUDIO_DIR/prebuilts/studio/sdk/linux" ]; then
        cp -rf $TOOLS_DIR/Sdk $STUDIO_DIR/prebuilts/studio/sdk/
        mv $STUDIO_DIR/prebuilts/studio/sdk/Sdk $STUDIO_DIR/prebuilts/studio/sdk/linux

        mkdir -p $STUDIO_DIR/prebuilts/studio/sdk/linux/build-tools/30.0.3/
        cp $TOOLS_DIR/android_studio-patches/studio-2024.3.2-patch/prebuilts/studio/sdk/linux/build-tools/30.0.3/aidl \
            $STUDIO_DIR/prebuilts/studio/sdk/linux/build-tools/30.0.3/
    fi

    if [ ! -d "$STUDIO_DIR/prebuilts/studio/intellij-sdk/AI" ]; then
        mkdir -p $STUDIO_DIR/prebuilts/studio/intellij-sdk/AI
        tools/adt/idea/studio/update_sdk.py --path tools/idea/out/studio/dist

        cp $TOOLS_DIR/android_studio-patches/studio-2024.3.2-patch/prebuilts/studio/intellij-sdk/BUILD \
            $STUDIO_DIR/prebuilts/studio/intellij-sdk/
        
        if [ -f "$STUDIO_DIR/tools/replace_intellij.sh" ]; then
            ./tools/replace_intellij.sh
        fi
    fi

    tools/base/bazel/bazel build tools/adt/idea/android:artifacts
    
    # 第三步：编译 Android Studio插件
    log_info "步骤 3: 编译 Android Studio插件"
    tools/base/bazel/bazel build tools/adt/idea/studio:android-studio
    
    log_success "Android Studio 编译完成！"
}

# 编译 layoutlib
build_layoutlib() {
    log_info "开始编译 layoutlib..."
    
    cd "$TOOLS_DIR"
    
    # 编译 layoutlib.jar (需要 AOSP 环境)
    if [ ! -f "$STUDIO_DIR/prebuilts/studio/layoutlib/data/arm64.flag" ]; then
        log_warning "layoutlib.jar 需要 AOSP 环境编译，请手动执行"
        log_warning "参考链接: https://openfde.atlassian.net/wiki/spaces/OpenFDE/pages/559415300/Android+Stuido+arm64"
        echo "1. 下载 Android 14 源码"
        echo "2. 应用 layoutlib 补丁"
        echo "3. 执行: mmm frameworks/layoutlib -j32"
        echo "注： 这里使用已编译完成的layoutlib.jar进行替换"

        cp $TOOLS_DIR/android_studio-patches/studio-2024.3.2-patch/prebuilts/studio/layoutlib/data/layoutlib.jar \
            $STUDIO_DIR/prebuilts/studio/layoutlib/data/
        touch $STUDIO_DIR/prebuilts/studio/layoutlib/data/arm64.flag

        log_success "layoutlib.jar 替换完成！"
    fi
    
    # 编译 layoutlib_jni.so
    if [ ! -f "$STUDIO_DIR/prebuilts/studio/layoutlib/data/linux/lib64/arm64.flag" ]; then
        log_info "编译 layoutlib 动态库..."
        if [ ! -d "studio-layoutlib" ]; then
            git clone https://github.com/openfde/studio-layoutlib.git
        fi
        cd studio-layoutlib
        make clean && make && make install

        cp layoutlib_jni/*.so* $STUDIO_DIR/prebuilts/studio/layoutlib/data/linux/lib64/
        touch $STUDIO_DIR/prebuilts/studio/layoutlib/data/linux/lib64/arm64.flag

        log_success "layoutlib 编译完成！"
    fi
}

# 主函数
main() {
    log_info "开始 Android Studio ARM64 一键编译流程"
    log_info "主目录: $BUILD_BASE"
    log_info "Build Tools 目录: $TOOLS_DIR"
    log_info "Android Studio 目录: $STUDIO_DIR"
    log_info "Default build tool: $DEFAULT_BUILD_TOOL"
    
    # 创建目录
    mkdir -p "$TOOLS_DIR"
    mkdir -p "$STUDIO_DIR"
    
    # 执行各个步骤
    check_environment
    download_studio_patch
    build_python
    build_cmake
    if [ "$DEFAULT_BUILD_TOOL" != "PhyCC" ];then
        build_clang
    fi
    build_libedit
    build_libxml2
    build_ndk
    copy_ndk_to_sdk
    build_platform_tools
    copy_platform_tools_to_sdk
    build_layoutlib
    download_studio_source
    apply_studio_patches
    prepare_toolchains
    build_android_studio
    
    log_success "所有编译步骤完成！"
    log_info "编译输出位置: $STUDIO_DIR/bazel-bin/tools/adt/idea/studio/android-studio.linux.zip"
}

# 显示使用说明
show_usage() {
    echo "Android Studio ARM64 一键编译脚本"
    echo "用法: $0 [选项]"
    echo ""
    echo "选项:"
    echo "  -h, --help     显示此帮助信息"
    echo "  -p, --path     设置安装路径"
    echo "  -b, --build    设置Clang编译器安装路径"
    echo ""
    echo "示例:"
    echo "  $0                      # 完整编译，默认路径为 $HOME/Studio"
    echo "  $0 -p /openfde/Studio   # 指定代码下载路径为 /openfde/Studio"
    echo "  $0 -b /openfde/PhyCC    # 指定Clang编译器安装路径为 /openfde/PhyCC"
}

config_studio_path() {
    export BUILD_BASE="$NEW_BUILD_PATH"
    export STUDIO_VERSION="2024.3.2"
    export TOOLS_DIR="$BUILD_BASE/build-tools"
    export STUDIO_DIR="$BUILD_BASE/studio-$STUDIO_VERSION"
}

config_phycc_env() {
    if [ ! -f "$PHYCC_PATH/bin/clang" ]; then
        log_error "PhyCC: $PHYCC_PATH not exist!"
        exit 0
    fi

    export PATH=$PHYCC_PATH/bin:$PATH
    export LD_LIBRARY_PATH=$PHYCC_PATH/lib:$LD_LIBRARY_PATH
    if ! clang --version 2>/dev/null | head -n1 | grep -q "PhyCC"; then
        log_error "PhyCC 未安装成功: $PHYCC_PATH"
        exit 0
    fi

    DEFAULT_BUILD_TOOL="PhyCC"
}

# 解析命令行参数
NEW_BUILD_PATH=""
PHYCC_PATH=""
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_usage
            exit 0
            ;;
        -p|--path)
            NEW_BUILD_PATH="$2"
            config_studio_path
            break
            ;;
        -b|--build)
            PHYCC_PATH="$2"
            config_phycc_env
            break
            ;;
        *)
            log_error "未知参数: $1"
            show_usage
            exit 1
            ;;
    esac
done

main