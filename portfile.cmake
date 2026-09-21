vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO jonathondgebhardt/shift
    REF "651324f2a7469228af5e8cbac7cfe4a21089d7d3"
    SHA512 e2daf727773ea6789ba01f22c2fbeef033a178dce0e47d7efb85291ca25324c259fa47546d181c687cff684a4f04fef793b7111291b71825e39424a40bba2830
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -Dshift_INSTALL_CMAKEDIR="${CURRENT_PACKAGES_DIR}/share/${PORT}/cmake"
)

vcpkg_cmake_install()

# this causes a downstream build error
#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(TOUCH "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage-accurate")

# todo: add a LICENSE
#vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)
