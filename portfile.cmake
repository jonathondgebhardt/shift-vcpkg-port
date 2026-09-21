vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO jonathondgebhardt/shift
    REF "cbc79388422b11f036363af7a6db3897cee88007"
    SHA512 698a30aa1105d7f3f38f8e7263361aca5209df0bdf5a6fd05a2c61211acbc3f9b13269746098529d17d6658fbe78aaa218a7589993f66a67d612f5b30dd599de
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
