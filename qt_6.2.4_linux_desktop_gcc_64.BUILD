load("@de_vertexwahn_rules_qt6//:qt_libraries.bzl", "QT_LIBRARIES")

[
    cc_library(
        name = "qt_%s_linux" % name,
        srcs = glob([
            "lib/lib%s.so*" % library_name,
            "lib/libicu*.so*",
        ]),
        hdrs = glob(["include/%s/**" % include_folder]),
        includes = ["include"],
        target_compatible_with = ["@platforms//os:linux"],
        visibility = ["//visibility:public"],
    )
    for name, include_folder, library_name, _ in QT_LIBRARIES
]

filegroup(
    name = "uic",
    srcs = ["libexec/uic"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "moc",
    srcs = ["libexec/moc"],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "plugin_files",
    srcs = glob(["plugins/**/*"]),
    visibility = ["//visibility:public"],
)
