
set(CMUT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../tools/cmut")
include("${CMAKE_CURRENT_LIST_DIR}/../tools/byd/cmake/modules/byd__generate_and_build.cmake")

function(bydist__configure_and_build)
    byd__generate_and_build(${ARGN})
endfunction()
