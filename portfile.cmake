vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO jonathondgebhardt/shift
    REF "0de88b29a089d658f7397ea7865e3cb988354e5d"
    SHA512 73b7ffc38ebe50fe33345948ff5acba2e123ce02c2be99f1870c1ba22cc880231da8f2f46a7871f614b9d1e42e515689f1a4da2cd88db30897944fc3551a9f51
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
