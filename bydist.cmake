
set(BYDIST_ROOT "${CMAKE_CURRENT_LIST_DIR}")

get_filename_component(CMUT_ROOT "${BYDIST_ROOT}/tools/cmut" ABSOLUTE)
get_filename_component(BYD_ROOT "${BYDIST_ROOT}/tools/byd" ABSOLUTE)


include("${BYDIST_ROOT}/cmake/bydist__option__build_dependencies.cmake")
include("${BYDIST_ROOT}/cmake/configure_and_build.cmake")

include("${BYD_ROOT}/byd.cmake")

byd__add_package_repositories("${BYDIST_ROOT}/packages")
