load("@bazel_tools//tools/python:toolchain.bzl", "py_runtime_pair")

package(default_visibility = ["//visibility:public"])

py_runtime(
    name = "prebuilt_python3",
    files = [":linux-arm64"],
    interpreter = "bin/python3",
    python_version = "PY3",
)

py_runtime_pair(
    name = "prebuilt_python",
    py2_runtime = None,
    py3_runtime = ":prebuilt_python3",
)

toolchain(
    name = "python_toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
    ],
    toolchain = ":prebuilt_python",
    toolchain_type = "@bazel_tools//tools/python:toolchain_type",
)

filegroup(
    name = "linux-arm64",
    srcs = glob(
        include = ["**"],
        exclude = [
            "**/*.pyc",
            "lib/python3.11/**/__pycache__/**",
        ],
    ),
)

filegroup(
    name = "linux-arm64-bundle",
    srcs = glob(
        include = ["lib/python3.11/**"],
        exclude = [
            "lib/python3.11/**/__pycache__/**",
            "lib/python3.11/**/*.pyc",
            "lib/python3.11/test/**",
            "lib/python3.11/unittest/**",
            "lib/python3.11/config/**",
            "lib/python3.11/distutils/**",
            "lib/python3.11/idlelib/**",
            "lib/python3.11/lib2to3/**",
            "lib/python3.11/plat-linux2/**",
            "lib/python3.11/bsddb/test/**",
            "lib/python3.11/ctypes/test/**",
            "lib/python3.11/email/test/**",
            "lib/python3.11/lib-tk/test/**",
            "lib/python3.11/sqlite3/test/**",
            "lib/python3.11/site-packages/setuptools/gui-64.exe",
            "lib/python3.11/site-packages/setuptools/gui.exe",
            "lib/python3.11/site-packages/setuptools/cli.exe",
            "lib/python3.11/site-packages/setuptools/cli-64.exe",
            "lib/python3.11/site-packages/setuptools/cli-32.exe",
            "lib/python3.11/site-packages/setuptools/gui-32.exe",
            "lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe",
            "lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe",
            "lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe",
            "lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe",
        ],
    ),
)
