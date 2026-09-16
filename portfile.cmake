vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO jonathondgebhardt/shift
    REF "1048131abd88103df0c7c093b36ac9514a3ed736"
    SHA512 a8d528a26ba4a4435fa64d4f19b577ab84cf1462281130db7e29620d88f18ba5ccd6c400ce1ab168647d80e2cbc1ec108f4aea79b40e193b2968851592b92e70
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
