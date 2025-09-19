commit 28b0e3a31d1d7c2fa9f50112e2b7ef46d1a9710d (HEAD -> studio-2024.3.2)
Author: pngcui <pngcui1224@163.com>
Date:   Thu Sep 18 16:56:32 2025 +0800

    add protoc package

    Change-Id: I4e53b22cb67fcd5f0ea89d7df3ac509abe8b1554

 common/m2/BUILD                                                                                         |  16 +++++++++-------
 common/m2/repository/com/google/protobuf/protoc/3.19.6/protoc-3.19.6-linux-aarch_64.exe                 | Bin 0 -> 6069960 bytes
 common/m2/repository/com/google/protobuf/protoc/3.19.6/protoc-3.19.6-linux-aarch_64.exe.sha1            |   1 +
 common/m2/repository/com/google/protobuf/protoc/3.22.3/protoc-3.22.3-linux-aarch_64.exe                 | Bin 0 -> 7865576 bytes
 common/m2/repository/com/google/protobuf/protoc/3.22.3/protoc-3.22.3-linux-aarch_64.exe.sha1            |   1 +
 common/m2/repository/com/google/protobuf/protoc/3.24.4/protoc-3.24.4-linux-aarch_64.exe                 | Bin 0 -> 8541384 bytes
 common/m2/repository/com/google/protobuf/protoc/3.24.4/protoc-3.24.4-linux-aarch_64.exe.sha1            |   1 +
 common/m2/repository/io/grpc/protoc-gen-grpc-java/1.57.0/protoc-gen-grpc-java-1.57.0-linux-aarch_64.exe | Bin 0 -> 2440360 bytes
 common/m2/repository/io/grpc/protoc-gen-grpc-java/1.66.0/protoc-gen-grpc-java-1.66.0-linux-aarch_64.exe | Bin 0 -> 1456928 bytes
 9 files changed, 12 insertions(+), 7 deletions(-)
openfde@08f59ccd4795:/openfde/studio-2024.3.2/prebuilts/tools$ git show HEAD^ --stat
commit 1e0ccf5295c2f9ee07a461d0b373c597a009e87e
Author: pngcui <pngcui1224@163.com>
Date:   Mon Sep 15 09:29:29 2025 +0800

    add bazelisk for linux arm64

    Change-Id: I9e79d810487e20dfb5108ea001cd81c167156e65

 linux-arm64/bazel/bazelisk | Bin 0 -> 5767320 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)