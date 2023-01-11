"""qt library fetch"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def fetch_qt6():
    """function which fetch remote prebuild qt libraries or use local qt(in macos)
    """

    http_archive(
        name = "qt_windows_x86_64",
        urls = [
            "https://vertexwahn.de/lfs/v1/qt_6.4.0_windows_desktop_win64_msvc2019_64.zip",
        ],
        sha256 = "e3c20b441ddd8bb803e46de32bf2fc5563fda125409d62dcd12b5647ae5a9c7e",
        strip_prefix = "6.4.0/msvc2019_64",
        build_file = "@rules_qt//:qt_windows_x86_64.BUILD",
    )

    #native.new_local_repository(
    #    name = "qt_windows_x86_64",
    #    path = "C:\\Qt\\6.4.0\\msvc2019_64",
    #    build_file = "@rules_qt//:qt_windows_x86_64.BUILD",
    #)

    # http_archive(
    #     name = "qt_linux_x86_64",
    #     urls = [
    #         "https://vertexwahn.de/lfs/v1/qt_6.4.0_linux_desktop_gcc_64.tar.xz",
    #     ],
    #     sha256 = "809919895e2ac0567df9290676d4ec6cd1ed39c432dc5da0722b3104681fd376",
    #     strip_prefix = "6.4.0/gcc_64",
    #     build_file = "@rules_qt//:qt_linux_x86_64.BUILD",
    # )

    http_archive(
        name = "qt_linux_x86_64",
        urls = [
            "https://devops-generic.pkg.coding.smoa.cloud/artifacts/qt/qt-6.3.2-linux-x64.tar.gz?version=latest",
        ],
        sha256 = "5d8ed26a8ae42abac074aa4b3d901922d75a8cf59f0ea66c7aebe03cbef202f7",
        strip_prefix = "qt",
        build_file = "@rules_qt//:qt_linux_x86_64.BUILD",
    )

    #http_archive(
    #    name = "qt_mac_x86_64",
    #    urls = ["https://vertexwahn.de/lfs/v1/qt_mac_x86_64.zip"],
    #    sha256 = "9543aa178a6fe6aa138e4319fb07a106375b7fef11be150d154d5c1b8a321721",
    #    strip_prefix = "6.2.4/macos",
    #    build_file = "@rules_qt////:qt_mac_x86_64.BUILD",
    #)

    # On macOS we make use of an system installed Qt6
    # installation works via:
    # $ brew install qt@6
    # $ brew link qt@6

    # Check if path exists
    native.new_local_repository(
        name = "qt_mac_x86_64",
        path = "/usr/local/opt/qt@6",  #"/usr/local/opt/qt@6",
        build_file = "@rules_qt//:qt_mac_x86_64.BUILD",
    )

    native.new_local_repository(
        name = "qt_mac_aarch64",
        path = "/opt/homebrew/",  # after brew link, is't ok just use /opt/homebrew
        build_file = "@rules_qt//:qt_mac_aarch64.BUILD",
    )
