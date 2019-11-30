#  SYPHON_FOUND - system has SYPHON
#  SYPHON_INCLUDE_DIRS - the SYPHON include directories
#  SYPHON_LIBRARIES - link these to use SYPHON

include(ext/LibFindMacros)

if (NOT SYPHON_SDK_DIR)
    message(FATAL_ERROR "Please set SYPHON_SDK_DIR variable (directory containing Syphon SDK)")
endif ()

if (APPLE)
    set(SYPHON_BASE_DIR ${SYPHON_SDK_DIR})
else ()
    message(FATAL_ERROR "OS not supported by Syphon")
endif ()

find_path(SYPHON_INCLUDE_DIR
        NAMES
        Syphon.h
        PATHS
        "${SYPHON_BASE_DIR}/Headers"
        )

if (WIN32)
    find_library(SYPHON_LIBRARY
            NAMES
            Syphon
            PATHS
            "${SYPHON_BASE_DIR}"
            )
endif ()

set(SYPHON_PROCESS_INCLUDES SYPHON_INCLUDE_DIR)
set(SYPHON_PROCESS_LIBS SYPHON_LIBRARY)
libfind_process(SYPHON)

message(STATUS "SYPHON_LIBRARIES: ${SYPHON_LIBRARIES}")
message(STATUS "SYPHON_INCLUDE_DIRS: ${SYPHON_INCLUDE_DIRS}")
