#!/bin/bash

cur_dir=$(pwd)
src_path=$1

echo "git am for src/abseil-cpp"
cp $cur_dir/src/abseil-cpp/000*.patch $src_path/abseil-cpp/
cd $src_path/abseil-cpp
git am 000*.patch
rm $src_path/abseil-cpp/000*.patch


echo "git am for src/adb"
cp $cur_dir/src/adb/000*.patch $src_path/adb/
cd $src_path/adb
git am 000*.patch
rm $src_path/adb/000*.patch


echo "git am for src/aidl"
cp $cur_dir/src/aidl/000*.patch $src_path/aidl/
cd $src_path/aidl
git am 000*.patch
rm $src_path/aidl/000*.patch


echo "git am for src/art"
cp $cur_dir/src/art/000*.patch $src_path/art/
cd $src_path/art
git am 000*.patch
rm $src_path/art/000*.patch


echo "git am for src/base"
cp $cur_dir/src/base/000*.patch $src_path/base/
cd $src_path/base
git am 000*.patch
rm $src_path/base/000*.patch


echo "git am for src/boringssl"
cp $cur_dir/src/boringssl/000*.patch $src_path/boringssl/
cd $src_path/boringssl
git am 000*.patch
rm $src_path/boringssl/000*.patch


echo "git am for src/core"
cp $cur_dir/src/core/000*.patch $src_path/core/
cd $src_path/core
git am 000*.patch
rm $src_path/core/000*.patch


echo "git am for src/e2fsprogs"
cp $cur_dir/src/e2fsprogs/000*.patch $src_path/e2fsprogs/
cd $src_path/e2fsprogs
git am 000*.patch
rm $src_path/e2fsprogs/000*.patch


echo "git am for src/f2fs-tools"
cp $cur_dir/src/f2fs-tools/000*.patch $src_path/f2fs-tools/
cd $src_path/f2fs-tools
git am 000*.patch
rm $src_path/f2fs-tools/000*.patch


echo "git am for src/fmtlib"
cp $cur_dir/src/fmtlib/000*.patch $src_path/fmtlib/
cd $src_path/fmtlib
git am 000*.patch
rm $src_path/fmtlib/000*.patch


echo "git am for src/libziparchive"
cp $cur_dir/src/libziparchive/000*.patch $src_path/libziparchive/
cd $src_path/libziparchive
git am 000*.patch
rm $src_path/libziparchive/000*.patch


echo "git am for src/openscreen"
cp $cur_dir/src/openscreen/000*.patch $src_path/openscreen/
cd $src_path/openscreen
git am 000*.patch
rm $src_path/openscreen/000*.patch


echo "git am for src/protobuf"
cp $cur_dir/src/protobuf/000*.patch $src_path/protobuf/
cd $src_path/protobuf
git am 000*.patch
rm $src_path/protobuf/000*.patch


echo "finish!!"