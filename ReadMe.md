
此仓库主要放置编译andrid studio 2024.3.2版本所修改的补丁，以及部分原始文件

1.clang-r536225-build-sh/build-arm64-aosp-clang.sh为构建clang所用的编译脚本

2.studio-2024.3.2-patch为编译时修改的补丁

3.ndk-build-patch为编译ndk工具时修改的补丁

4.layoutlib-patch为android14上编译layoutlib.jar的补丁

5.platform-tools-patch为编译platform-tools-34.0.0版本修改的补丁

6.build_android_studio_arm64.sh 为从0开始下载代码与编译android studio的一键编译脚本

7.build.sh 为下载studio for arm64代码后的一键编译脚本 （repo init -u https://github.com/openfde/studio-manifests -b studio-2024.3.2）