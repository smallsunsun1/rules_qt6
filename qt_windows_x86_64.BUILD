load("@rules_qt//:qt_libraries.bzl", "QT_LIBRARIES")

[
    cc_import(
        name = "qt_%s_windows_import" % name,
        interface_library = "lib/%s.lib" % library_name,
        shared_library = "bin/%s.dll" % library_name,
        target_compatible_with = ["@platforms//os:windows"],
    )
    for name, include_folder, library_name, _ in QT_LIBRARIES
]

[
    cc_library(
        name = "qt_%s_windows" % name,
        includes = ["include"],
        target_compatible_with = ["@platforms//os:windows"],
        visibility = ["//visibility:public"],
        deps = [
            ":qt_%s_windows_import" % name,
            ":qt_hdrs",
        ],
    )
    for name, include_folder, _, _ in QT_LIBRARIES
]

cc_library(
    name = "qt_hdrs",
    hdrs = glob(["include/**"]),
    includes = [
        "include",
    ],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "uic",
    srcs = ["bin/uic.exe"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "moc",
    srcs = ["bin/moc.exe"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "rcc",
    srcs = ["bin/rcc.exe"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "plugin_files",
    srcs = glob(["plugins/**/*"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "qml_files",
    srcs = glob(["qml/**/*"]),
    visibility = ["//visibility:public"],
)
