#!/bin/bash

cur_dir=$(pwd)
studio_path=$1

echo "git am for $studio_path/build/bazel/"
cp $cur_dir/build/bazel/000* $studio_path/build/bazel/
cd $studio_path/build/bazel/
git am 000*
rm $studio_path/build/bazel/000*

echo "git am for $studio_path/external/jetbrains/kotlin"
cp $cur_dir/external/jetbrains/kotlin/000* $studio_path/external/jetbrains/kotlin/
cd $studio_path/external/jetbrains/kotlin/
git am 000*
rm $studio_path/external/jetbrains/kotlin/000*


echo "git am for $studio_path/tools/adt/idea"
cp $cur_dir/tools/adt/idea/000* $studio_path/tools/adt/idea/
cd $studio_path/tools/adt/idea/
git am 000*
rm $studio_path/tools/adt/idea/000*


echo "git am for $studio_path/tools/analytics-library"
cp $cur_dir/tools/analytics-library/000* $studio_path/tools/analytics-library/
cd $studio_path/tools/analytics-library/
git am 000*
rm $studio_path/tools/analytics-library/000*


echo "git am for $studio_path/tools/base"
cp $cur_dir/tools/base/000* $studio_path/tools/base/
cd $studio_path/tools/base/
git am 000*
rm $studio_path/tools/base/000*


echo "git am for $studio_path/tools/data-binding"
cp $cur_dir/tools/data-binding/000* $studio_path/tools/data-binding/
cd $studio_path/tools/data-binding/
git am 000*
rm $studio_path/tools/data-binding/000*


echo "git am for $studio_path/tools/idea"
cp $cur_dir/tools/idea/000* $studio_path/tools/idea/
cd $studio_path/tools/idea/
git am 000*
rm $studio_path/tools/idea/000*


echo "git am for $studio_path/tools/studio/google/cloud/testing"
cp $cur_dir/tools/studio/google/cloud/testing/000* $studio_path/tools/studio/google/cloud/testing/
cd $studio_path/tools/studio/google/cloud/testing/
git am 000*
rm $studio_path/tools/studio/google/cloud/testing/000*


echo "git am for $studio_path/tools/studio/google/cloud/tools"
cp $cur_dir/tools/studio/google/cloud/tools/000* $studio_path/tools/studio/google/cloud/tools/
cd $studio_path/tools/studio/google/cloud/tools/
git am 000*
rm $studio_path/tools/studio/google/cloud/tools/000*


echo "git am for $studio_path/tools/swing-testing"
cp $cur_dir/tools/swing-testing/000* $studio_path/tools/swing-testing/
cd $studio_path/tools/swing-testing/
git am 000*
rm $studio_path/tools/swing-testing/000*


echo "git am for $studio_path/prebuilts/tools"
cp $cur_dir/prebuilts/tools/000* $studio_path/prebuilts/tools/
cd $studio_path/prebuilts/tools/
git am 000*
rm $studio_path/prebuilts/tools/000*


echo "copy replace_intellij.sh to $studio_path/tools"
cp $cur_dir/tools/replace_intellij.sh $studio_path/tools/


echo "finish!!"