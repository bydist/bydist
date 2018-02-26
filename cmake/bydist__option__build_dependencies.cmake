
function(bydist__option__build_dependencies source_dir)

    option(BUILD_DEPENDENCIES "Enable to build dependencies with bydist" OFF)


    if(BUILD_DEPENDENCIES)

        cmut__utils__parse_arguments(
            bydist__option__build_dependencies
            ARG_
            ""
            ""
            "CMAKE_ARGS"
            ${ARGN}
            )



        if(CMAKE_TOOLCHAIN_FILE AND (NOT IS_ABSOLUTE "${CMAKE_TOOLCHAIN_FILE}"))
            cmut_fatal("CMAKE_TOOLCHAIN_FILE should be an absolute path.")
        endif()

        bydist__configure_and_build(
            "${source_dir}"
            CMAKE_ARGS "-D${PROJECT_NAME}_BUILD_TESTING=${BUILD_TESTING}" ${ARG__CMAKE_ARGS}
        )

        set(dependencies_install "${CMAKE_BINARY_DIR}/byd/_install")

        cmut__utils__list_prepend(CMAKE_PREFIX_PATH "${dependencies_install}")
        cmut_info("[${PROJECT_NAME}] : CMAKE_PREFIX_PATH = ${CMAKE_PREFIX_PATH}")
        set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH}" PARENT_SCOPE)

        if(ANDROID)
            set( CMAKE_FIND_ROOT_PATH "${dependencies_install}")
            cmut_info("[${PROJECT_NAME}] : CMAKE_FIND_ROOT_PATH = ${CMAKE_FIND_ROOT_PATH}")
            set( CMAKE_FIND_ROOT_PATH "${CMAKE_FIND_ROOT_PATH}" PARENT_SCOPE)
        endif()

    endif()

endfunction()
