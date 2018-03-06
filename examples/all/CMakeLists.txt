cmake_minimum_required(VERSION 3.7.2)
cmake_policy(VERSION 3.7)


project(example_all VERSION 0.2)



get_filename_component(BYDIST_ROOT "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE)
include("${BYDIST_ROOT}/bydist.cmake")


include(CTest)


##--------------------------------------------------------------------------------------------------------------------##
##  cmake variable/options  ------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##
set(CMAKE_MACOSX_RPATH TRUE)




##--------------------------------------------------------------------------------------------------------------------##
##  packages  --------------------------------------------------------------------------------------------------------##
##--------------------------------------------------------------------------------------------------------------------##

file(GLOB packages
    LIST_DIRECTORIES true
    RELATIVE "${BYDIST_ROOT}/packages"
    "${BYDIST_ROOT}/packages/*"
    )

cmut_info("packages = ${packages}")

foreach(package IN LISTS packages)
    byd__add_package(${package})
endforeach()

byd__run()
