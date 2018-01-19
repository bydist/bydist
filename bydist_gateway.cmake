
if(NOT DEFINED CMUT_VERSION)
    include("${CMAKE_CURRENT_LIST_DIR}/tools/cmut/cmut.cmake")
endif()
include("${CMAKE_CURRENT_LIST_DIR}/cmake/bydist__option__build_dependencies.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/cmake/bydist__configure_and_build.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/tools/byd/cmake/modules/byd__generate_and_build.cmake")
