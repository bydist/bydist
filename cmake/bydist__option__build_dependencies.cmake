
include("${CMUT_ROOT}/cmut_message.cmake")

function(bydist__option__build_dependencies source_dir)

    option(BUILD_DEPENDENCIES "Enable to build dependencies with bydist" OFF)


    if(BUILD_DEPENDENCIES)

        if(CMAKE_TOOLCHAIN_FILE AND (NOT IS_ABSOLUTE "${CMAKE_TOOLCHAIN_FILE}"))
            cmut_fatal("CMAKE_TOOLCHAIN_FILE should be an absolute path.")
        endif()

        bydist__configure_and_build(
            "${source_dir}"
            CMAKE_ARGS "-D${PROJECT_NAME}_BUILD_TESTING=${BUILD_TESTING}"
        )

        set(dependencies_install "${CMAKE_BINARY_DIR}/byd/_install")

        set(CMAKE_PREFIX_PATH "${dependencies_install}" "${CMAKE_PREFIX_PATH}" PARENT_SCOPE)
        cmut_info("[${PROJECT_NAME}] : CMAKE_PREFIX_PATH = ${CMAKE_PREFIX_PATH}")

        if(ANDROID)
            set( CMAKE_FIND_ROOT_PATH "${dependencies_install}" PARENT_SCOPE)
            cmut_info("[${PROJECT_NAME}] : CMAKE_FIND_ROOT_PATH = ${CMAKE_FIND_ROOT_PATH}")
        endif()

    endif()

endfunction()
