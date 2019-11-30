#  SPOUT_FOUND - system has SPOUT
#  SPOUT_INCLUDE_DIRS - the SPOUT include directories
#  SPOUT_LIBRARIES - link these to use SPOUT

include(ext/LibFindMacros)

if (NOT SPOUT_INSTALL_DIR)
    set(PF_x86 "PROGRAMFILES(x86)")
    set(SPOUT_INSTALL_DIR "$ENV{${PF_x86}}/Spout2")
endif ()

if (WIN32)
    set(SPOUT_BASE_DIR "${SPOUT_INSTALL_DIR}/SPOUTSDK/SPOUTLIBRARY")
else ()
    message(FATAL_ERROR "OS not supported by Spout")
endif ()

find_path(SPOUT_INCLUDE_DIR
        NAMES
        SpoutLibrary.h
        PATHS
        "${SPOUT_BASE_DIR}/Include"
        )

if (WIN32)
    find_library(SPOUT_LIBRARY
            NAMES
            SpoutLibrary
            PATHS
            "${SPOUT_BASE_DIR}/Binaries/x64"
            )
endif ()

set(SPOUT_PROCESS_INCLUDES SPOUT_INCLUDE_DIR)
set(SPOUT_PROCESS_LIBS SPOUT_LIBRARY)
libfind_process(SPOUT)

message(STATUS "SPOUT_LIBRARIES: ${SPOUT_LIBRARIES}")
message(STATUS "SPOUT_INCLUDE_DIRS: ${SPOUT_INCLUDE_DIRS}")
