#  PD_FOUND - system has PD
#  PD_INCLUDE_DIRS - the PD include directories
#  PD_LIBRARIES - link these to use PD

include(ext/LibFindMacros)

<<<<<<< HEAD
if (NOT PD_INSTALL_DIR)
    message(FATAL_ERROR "Please set PD_INSTALL_DIR variable (installation directory of Pure Data)")
endif ()

=======
>>>>>>> a402884baa83836012316520dfde9cf2de126564
if (WIN32)
    set(PD_BASE_DIR ${PD_INSTALL_DIR})
elseif (APPLE)
    set(PD_BASE_DIR ${PD_INSTALL_DIR}/Contents/Resources)
<<<<<<< HEAD
elseif (UNIX)
    set(PD_BASE_DIR ${PD_INSTALL_DIR})
=======
else ()
>>>>>>> a402884baa83836012316520dfde9cf2de126564
endif ()

find_path(PD_INCLUDE_DIR
        NAMES
        m_pd.h
        PATHS
        ${PD_BASE_DIR}/src
        )

<<<<<<< HEAD
if (WIN32)
=======
if (NOT APPLE)
>>>>>>> a402884baa83836012316520dfde9cf2de126564
    find_library(PD_LIBRARY
            NAMES
            pd
            PATHS
            ${PD_BASE_DIR}/bin
            )
endif ()

set(PD_PROCESS_INCLUDES PD_INCLUDE_DIR)
set(PD_PROCESS_LIBS PD_LIBRARY)
libfind_process(PD)

message(STATUS "PD_LIBRARIES: ${PD_LIBRARIES}")
message(STATUS "PD_INCLUDE_DIRS: ${PD_INCLUDE_DIRS}")
