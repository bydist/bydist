cmake_minimum_required(VERSION 3.7.2)
cmake_policy(VERSION 3.7)


project(example_all VERSION 0.1)



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

##############################

#byd__add_package(libzip)
#byd__add_package(libzippp)

byd__add_package(gen_prog)

byd__add_package(boost
    COMPONENTS
	date_time
	exception
	filesystem
	iostreams
	locale
	program_options
	regex
	system
	test
        thread
	timer
)

if((NOT ANDROID) OR (ANDROID AND (CMAKE_SYSTEM_VERSION VERSION_GREATER 19)))
    byd__add_package(boost
        COMPONENTS
	log
        )
endif()



if(NOT ANDROID)

    byd__add_package(OpenSSL)

    byd__add_package(Poco
        COMPONENTS
            JSON
            Net
            Util
            XML
            Zip
    )

    byd__add_package(Qt5
        COMPONENTS
            qtbase
            qtconnectivity
            qtdatavis3d
            qtdeclarative
            qtgraphicaleffects
            qtimageformats
            qtlocation
            qtmultimedia
            qtquickcontrols
            qtquickcontrols2
            qtsensors
            qtsvg
            qttools
            qttranslations
            qtwebchannel
            qtwebengine
        )

    byd__add_package(QuaZip)

    byd__add_package(turtle)

    if(UNIX)
        byd__add_package(LibVNCServer
            COMPONENTS
                vncclient
        )
    endif()
endif()

if(NOT ANDROID)
    byd__add_package(GoogleBreakpad)
endif()

#byd__add_package(ThreadPool)

byd__run()

install(CODE "message(\"start install step\")")
