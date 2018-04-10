# - Try to find KMSSUBSENSE library

#=============================================================================
# Copyright 2014 Kurento
#
#=============================================================================

set(PACKAGE_VERSION "0.0.1~0.g5d17b47")
set(KMSSUBSENSE_VERSION ${PACKAGE_VERSION})

message (STATUS "Looking for KMSSUBSENSE: 0.0.1~0.g5d17b47")

include (GenericFind)

generic_find (
  REQUIRED
  LIBNAME KMSCORE
  VERSION ^6.0.0
)

generic_find (
  REQUIRED
  LIBNAME KMSELEMENTS
  VERSION ^6.0.0
)

generic_find (
  REQUIRED
  LIBNAME KMSFILTERS
  VERSION ^6.0.0
)

set (REQUIRED_VARS
  KMSSUBSENSE_VERSION
  KMSSUBSENSE_INCLUDE_DIRS
  KMSSUBSENSE_LIBRARY
  KMSSUBSENSE_LIBRARIES
)

set (KMSSUBSENSE_BINARY_DIR_PREFIX "build" CACHE PATH "Path prefix used to look for binary files")
set (KMSSUBSENSE_SOURCE_DIR_PREFIX "" CACHE PATH "Path prefix used to look for source files")

set(KMSSUBSENSE_INCLUDE_DIRS
  ${KMSCORE_INCLUDE_DIRS}
  ${KMSELEMENTS_INCLUDE_DIRS}
  ${KMSFILTERS_INCLUDE_DIRS}
)

if (NOT "Subsense.hpp SubsenseInternal.hpp" STREQUAL " ")
  if (TARGET kmssubsenseinterface)
    set (KMSSUBSENSE_INTERFACE_INCLUDE_DIR "${KMSSUBSENSE_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp")
  else ()
    find_path(KMSSUBSENSE_INTERFACE_INCLUDE_DIR
      NAMES
        Subsense.hpp
        SubsenseInternal.hpp
      PATH_SUFFIXES
        ${KMSSUBSENSE_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp
        kurento/modules/subsense
    )
  endif ()

  list (APPEND KMSSUBSENSE_INCLUDE_DIRS ${KMSSUBSENSE_INTERFACE_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSSUBSENSE_INTERFACE_INCLUDE_DIR)
endif ()

if (NOT "SubsenseImplFactory.hpp" STREQUAL "")
  if (TARGET kmssubsenseimpl)
    set (KMSSUBSENSE_IMPLEMENTATION_INTERNAL_INCLUDE_DIR "${KMSSUBSENSE_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp")
  else ()
    find_path(KMSSUBSENSE_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
      NAMES
        SubsenseImplFactory.hpp
      PATH_SUFFIXES
        ${KMSSUBSENSE_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp
        kurento/modules/subsense
    )
  endif ()

  list (APPEND KMSSUBSENSE_INCLUDE_DIRS ${KMSSUBSENSE_IMPLEMENTATION_INTERNAL_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSSUBSENSE_IMPLEMENTATION_INTERNAL_INCLUDE_DIR)
endif ()

if (NOT "SubsenseOpenCVImpl.hpp SubsenseImpl.hpp" STREQUAL "")
  if (TARGET kmssubsenseimpl)
    set (KMSSUBSENSE_IMPLEMENTATION_GENERATED_INCLUDE_DIR "${KMSSUBSENSE_SOURCE_DIR_PREFIX}/src/server/implementation/objects")
  else ()
    find_path(KMSSUBSENSE_IMPLEMENTATION_GENERATED_INCLUDE_DIR
      NAMES
        SubsenseOpenCVImpl.hpp SubsenseImpl.hpp
      PATH_SUFFIXES
        src/server/implementation/objects
        kurento/modules/subsense
    )
  endif ()

  list (APPEND KMSSUBSENSE_INCLUDE_DIRS ${KMSSUBSENSE_IMPLEMENTATION_GENERATED_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSSUBSENSE_IMPLEMENTATION_GENERATED_INCLUDE_DIR)
endif()

if (NOT "SuBSENSE.h IBGS.h BackgroundSubtractorSuBSENSE.h BackgroundSubtractorLBSP.h LBSP.h DistanceUtils.h RandUtils.h" STREQUAL "")
  if (TARGET kmssubsenseimpl)
    set (KMSSUBSENSE_IMPLEMENTATION_EXTRA_INCLUDE_DIR "${KMSSUBSENSE_SOURCE_DIR_PREFIX}/src/server/")
  else ()
    find_path(KMSSUBSENSE_IMPLEMENTATION_EXTRA_INCLUDE_DIR
      NAMES
        SuBSENSE.h IBGS.h BackgroundSubtractorSuBSENSE.h BackgroundSubtractorLBSP.h LBSP.h DistanceUtils.h RandUtils.h
      PATH_SUFFIXES
        src/server/
        kurento/modules/subsense
    )
  endif ()

  list (APPEND KMSSUBSENSE_INCLUDE_DIRS ${KMSSUBSENSE_IMPLEMENTATION_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSSUBSENSE_IMPLEMENTATION_EXTRA_INCLUDE_DIR)
endif ()

if (NOT "" STREQUAL "")
  if (TARGET kmssubsenseinterface)
    set (KMSSUBSENSE_INTERFACE_EXTRA_INCLUDE_DIR "${KMSSUBSENSE_SOURCE_DIR_PREFIX}/")
  else ()
    find_path(KMSSUBSENSE_INTERFACE_EXTRA_INCLUDE_DIR
      NAMES
        
      PATH_SUFFIXES
        
        kurento/modules/subsense
    )
  endif()

  list (APPEND KMSSUBSENSE_INCLUDE_DIRS ${KMSSUBSENSE_INTERFACE_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSSUBSENSE_INTERFACE_EXTRA_INCLUDE_DIR)
endif ()

if (TARGET kmssubsenseimpl)
  set (KMSSUBSENSE_LIBRARY kmssubsenseimpl)
else ()
  find_library (KMSSUBSENSE_LIBRARY
    NAMES
      kmssubsenseimpl
    PATH_SUFFIXES
      ${KMSSUBSENSE_BINARY_DIR_PREFIX}/src/server
  )
endif()

set (REQUIRED_LIBS "")
foreach (LIB ${REQUIRED_LIBS})
  string(FIND ${LIB} " " POS)

  if (${POS} GREATER 0)
    string(REPLACE " " ";" REQUIRED_LIB_LIST ${LIB})
    include (CMakeParseArguments)
    cmake_parse_arguments("PARAM" "" "LIBNAME" "" ${REQUIRED_LIB_LIST})

    if (DEFINED PARAM_LIBNAME)
      generic_find (${REQUIRED_LIB_LIST} REQUIRED)
      set (LIB_NAME ${PARAM_LIBNAME})
    else()
      string (SUBSTRING ${LIB} 0 ${POS} LIB_NAME)
      string (SUBSTRING ${LIB} ${POS} -1 LIB_VERSION)
      string (STRIP ${LIB_NAME} LIB_NAME)
      string (STRIP ${LIB_VERSION} LIB_VERSION)
      generic_find (LIBNAME ${LIB_NAME} REQUIRED VERSION "${LIB_VERSION}")
    endif()
  else ()
    string (STRIP ${LIB} LIB_NAME)
    generic_find (LIBNAME ${LIB_NAME} REQUIRED)
  endif ()
  list (APPEND REQUIRED_LIBRARIES ${${LIB_NAME}_LIBRARIES})
  list (APPEND KMSSUBSENSE_INCLUDE_DIRS ${${LIB_NAME}_INCLUDE_DIRS})

endforeach()

set(KMSSUBSENSE_INCLUDE_DIRS
  ${KMSSUBSENSE_INCLUDE_DIRS}
  CACHE INTERNAL "Include directories for KMSSUBSENSE library" FORCE
)

set (KMSSUBSENSE_LIBRARIES
  ${KMSSUBSENSE_LIBRARY}
  ${KMSCORE_LIBRARIES}
  ${KMSELEMENTS_LIBRARIES}
  ${KMSFILTERS_LIBRARIES}
  ${REQUIRED_LIBRARIES}
  CACHE INTERNAL "Libraries for KMSSUBSENSE" FORCE
)

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args(KMSSUBSENSE
  FOUND_VAR
    KMSSUBSENSE_FOUND
  REQUIRED_VARS
    ${REQUIRED_VARS}
  VERSION_VAR
    KMSSUBSENSE_VERSION
)

mark_as_advanced(
  KMSSUBSENSE_FOUND
  KMSSUBSENSE_VERSION
  KMSSUBSENSE_INTERFACE_INCLUDE_DIR
  KMSSUBSENSE_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
  KMSSUBSENSE_IMPLEMENTATION_GENERATED_INCLUDE_DIR
  KMSSUBSENSE_IMPLEMENTATION_EXTRA_INCLUDE_DIR
  KMSSUBSENSE_INTERFACE_EXTRA_INCLUDE_DIR
  KMSSUBSENSE_INCLUDE_DIRS
  KMSSUBSENSE_LIBRARY
  KMSSUBSENSE_LIBRARIES
)
