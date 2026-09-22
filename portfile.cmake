vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO jonathondgebhardt/shift
    REF "b954b7acd947912bfd2d4caf4374f4221e652070"
    SHA512 69aff8061649cbaa129605b69d2ee0e9f8e0b0ef205709b3cbd74b01c5df83372b5a8319492523d7575259f646ac4b4350e078da61b2a8bd69de65fd37a0e208
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
