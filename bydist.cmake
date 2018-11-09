
set(BYDIST_ROOT "${CMAKE_CURRENT_LIST_DIR}")

get_filename_component(CMUT_ROOT "${BYDIST_ROOT}/tools/cmut" ABSOLUTE)
get_filename_component(BYD_ROOT "${BYDIST_ROOT}/tools/byd" ABSOLUTE)

include("${BYD_ROOT}/byd.cmake")

byd__add_fallback_package_repositories("${BYDIST_ROOT}/packages")
