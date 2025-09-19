#以clang-r536225为例
#以下的请查看#https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+/refs/heads/main/clang-r536225/manifest_12833971.xml，填写

llvm_project_version=b3a530ec6537146650e42be89f1089e9a3588460

binutils_version=c19795e958ed532462948fd14b1bdfd4f6e96e03

toolchain_utils_version=760c253c1ed00ce9abd48f8546f08516e57485fe

llvm_android_version=43ef7af1325b43e13d926d74a89741d4ace5fcf8

#svn值，请查看$PW/llvm_android/patches/PATCHES.json，按情况写
svn_version=536225

#clang安装路径
CV=clang-r536225
install_path=/openfde/build-tools/$CV

mkdir -p $install_path

export PW=/openfde/build-tools/clang-r536225-project

#每次变更，只需要更改↑上面的值即可，↓下面的可几乎可不动。
#----------------------------+--------------------------------------

#获取源码
#git clone https://android.googlesource.com/platform/external/toolchain-utils
#git clone https://android.googlesource.com/toolchain/binutils
#git clone https://android.googlesource.com/toolchain/llvm_android
#git clone https://android.googlesource.com/toolchain/llvm-project


#逐步检出指定版本
echo "git checkout $toolchain_utils_version"
cd $PW/toolchain-utils
git checkout $toolchain_utils_version

echo "git checkout $binutils_version"
cd $PW/binutils
git checkout $binutils_version

echo "git checkout $llvm_project_version"
cd $PW/llvm-project
git checkout $llvm_project_version

echo "git checkout $llvm_android_version"
cd $PW/llvm_android
git checkout $llvm_android_version


echo "py3 patch_manager.py"
#合入aosp clang补丁
python3 $PW/toolchain-utils/llvm_tools/patch_manager.py --svn_version $svn_version --patch_metadata_file $PW/llvm_android/patches/PATCHES.json --src_path $PW/llvm-project --failure_mode fail


echo "start build clang"
cd $PW/llvm-project
mkdir build
cd build

#使用ninja编译clang
echo "start ... cmake"
cmake -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb;polly;mlir;flang;compiler-rt;" \
        -DLLVM_ENABLE_RUNTIMES="libc;libunwind;libcxxabi;pstl;libcxx;openmp;offload" \
        -DLLVM_TARGETS_TO_BUILD="AArch64" \
        -DLLVM_BUILD_TESTS=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=$install_path ../llvm
echo "start ... ninja -j4"
ninja -j4

echo "start ... install"
ninja install

#使用make编译clang
#cmake -G "Unix Makefiles" -DLLVM_TARGETS_TO_BUILD="AArch64;ARM" -DLLVM_ENABLE_PROJECTS="clang;lld;compiler-rt" -DLLVM_ENABLE_WARNINGS=OFF -DLLVM_BUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$install_path ../llvm && make -j6 && make install


echo "end ... install"
#cd $PW/llvm-project && rm -rf build

#打包
#cd /home/fde/Studio
#tar -I pixz -cf $CV.tar.xz $CV













