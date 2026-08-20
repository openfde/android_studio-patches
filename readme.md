### &emsp;&emsp;This repository mainly contains patches modified for building Android Studio 2024.3.2, as well as some original files.<br>

- clang-r536225-build-sh/build-arm64-aosp-clang.sh is the build script used for building Clang.
- studio-2024.3.2-patch contains the patches modified during the compilation process.
- ndk-build-patch contains the patches modified for building the NDK toolchain.
- layoutlib-patch contains the patches for building layoutlib.jar on Android 14.
- platform-tools-patch contains the patches modified for building platform-tools version 34.0.0.
- build_android_studio_arm64.sh is an all-in-one build script that downloads the source code and builds Android Studio from scratch.
- build.sh is an all-in-one build script for use after downloading the studio-for-arm64 source code (repo init -u https://github.com/openfde/studio-manifests -b studio-2024.3.2 --git-lfs).

 &emsp;&emsp;For detailed build steps, please refer to: https://openfde.atlassian.net/wiki/spaces/OpenFDE/pages/559415300/Android+Stuido+arm64 <br>
 &emsp;&emsp;For the one-click build method for Android Studio, please refer to: https://openfde.atlassian.net/wiki/spaces/OpenFDE/pages/594083850/Android+Studio+for+linux+arm64<br>
The current Android Studio for Linux ARM64 version has undergone comprehensive functional testing on the Phytium Tengrui D3000/FT2000 platforms. We would like to express our sincere gratitude to Phytium Technology for their support.
