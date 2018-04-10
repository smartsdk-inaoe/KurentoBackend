# - Try to find KMSINDOORPEOPLEDETECTOR library

#=============================================================================
# Copyright 2014 Kurento
#
#=============================================================================

set(PACKAGE_VERSION "0.0.1~0.g1146bff")
set(KMSINDOORPEOPLEDETECTOR_VERSION ${PACKAGE_VERSION})

message (STATUS "Looking for KMSINDOORPEOPLEDETECTOR: 0.0.1~0.g1146bff")

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
  KMSINDOORPEOPLEDETECTOR_VERSION
  KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS
  KMSINDOORPEOPLEDETECTOR_LIBRARY
  KMSINDOORPEOPLEDETECTOR_LIBRARIES
)

set (KMSINDOORPEOPLEDETECTOR_BINARY_DIR_PREFIX "build" CACHE PATH "Path prefix used to look for binary files")
set (KMSINDOORPEOPLEDETECTOR_SOURCE_DIR_PREFIX "" CACHE PATH "Path prefix used to look for source files")

set(KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS
  ${KMSCORE_INCLUDE_DIRS}
  ${KMSELEMENTS_INCLUDE_DIRS}
  ${KMSFILTERS_INCLUDE_DIRS}
)

if (NOT "IndoorPeopleDetector.hpp IndoorPeopleDetectorInternal.hpp" STREQUAL " ")
  if (TARGET kmsindoorpeopledetectorinterface)
    set (KMSINDOORPEOPLEDETECTOR_INTERFACE_INCLUDE_DIR "${KMSINDOORPEOPLEDETECTOR_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp")
  else ()
    find_path(KMSINDOORPEOPLEDETECTOR_INTERFACE_INCLUDE_DIR
      NAMES
        IndoorPeopleDetector.hpp
        IndoorPeopleDetectorInternal.hpp
      PATH_SUFFIXES
        ${KMSINDOORPEOPLEDETECTOR_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp
        kurento/modules/indoorpeopledetector
    )
  endif ()

  list (APPEND KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS ${KMSINDOORPEOPLEDETECTOR_INTERFACE_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSINDOORPEOPLEDETECTOR_INTERFACE_INCLUDE_DIR)
endif ()

if (NOT "IndoorPeopleDetectorImplFactory.hpp" STREQUAL "")
  if (TARGET kmsindoorpeopledetectorimpl)
    set (KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR "${KMSINDOORPEOPLEDETECTOR_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp")
  else ()
    find_path(KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
      NAMES
        IndoorPeopleDetectorImplFactory.hpp
      PATH_SUFFIXES
        ${KMSINDOORPEOPLEDETECTOR_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp
        kurento/modules/indoorpeopledetector
    )
  endif ()

  list (APPEND KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS ${KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR)
endif ()

if (NOT "IndoorPeopleDetectorOpenCVImpl.hpp IndoorPeopleDetectorImpl.hpp" STREQUAL "")
  if (TARGET kmsindoorpeopledetectorimpl)
    set (KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR "${KMSINDOORPEOPLEDETECTOR_SOURCE_DIR_PREFIX}/src/server/implementation/objects")
  else ()
    find_path(KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR
      NAMES
        IndoorPeopleDetectorOpenCVImpl.hpp IndoorPeopleDetectorImpl.hpp
      PATH_SUFFIXES
        src/server/implementation/objects
        kurento/modules/indoorpeopledetector
    )
  endif ()

  list (APPEND KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS ${KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR)
endif()

if (NOT "VPDetector.hpp tinyxml2.h" STREQUAL "")
  if (TARGET kmsindoorpeopledetectorimpl)
    set (KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR "${KMSINDOORPEOPLEDETECTOR_SOURCE_DIR_PREFIX}/src/server/")
  else ()
    find_path(KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR
      NAMES
        VPDetector.hpp tinyxml2.h
      PATH_SUFFIXES
        src/server/
        kurento/modules/indoorpeopledetector
    )
  endif ()

  list (APPEND KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS ${KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR)
endif ()

if (NOT "" STREQUAL "")
  if (TARGET kmsindoorpeopledetectorinterface)
    set (KMSINDOORPEOPLEDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR "${KMSINDOORPEOPLEDETECTOR_SOURCE_DIR_PREFIX}/")
  else ()
    find_path(KMSINDOORPEOPLEDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR
      NAMES
        
      PATH_SUFFIXES
        
        kurento/modules/indoorpeopledetector
    )
  endif()

  list (APPEND KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS ${KMSINDOORPEOPLEDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSINDOORPEOPLEDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR)
endif ()

if (TARGET kmsindoorpeopledetectorimpl)
  set (KMSINDOORPEOPLEDETECTOR_LIBRARY kmsindoorpeopledetectorimpl)
else ()
  find_library (KMSINDOORPEOPLEDETECTOR_LIBRARY
    NAMES
      kmsindoorpeopledetectorimpl
    PATH_SUFFIXES
      ${KMSINDOORPEOPLEDETECTOR_BINARY_DIR_PREFIX}/src/server
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
  list (APPEND KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS ${${LIB_NAME}_INCLUDE_DIRS})

endforeach()

set(KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS
  ${KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS}
  CACHE INTERNAL "Include directories for KMSINDOORPEOPLEDETECTOR library" FORCE
)

set (KMSINDOORPEOPLEDETECTOR_LIBRARIES
  ${KMSINDOORPEOPLEDETECTOR_LIBRARY}
  ${KMSCORE_LIBRARIES}
  ${KMSELEMENTS_LIBRARIES}
  ${KMSFILTERS_LIBRARIES}
  ${REQUIRED_LIBRARIES}
  CACHE INTERNAL "Libraries for KMSINDOORPEOPLEDETECTOR" FORCE
)

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args(KMSINDOORPEOPLEDETECTOR
  FOUND_VAR
    KMSINDOORPEOPLEDETECTOR_FOUND
  REQUIRED_VARS
    ${REQUIRED_VARS}
  VERSION_VAR
    KMSINDOORPEOPLEDETECTOR_VERSION
)

mark_as_advanced(
  KMSINDOORPEOPLEDETECTOR_FOUND
  KMSINDOORPEOPLEDETECTOR_VERSION
  KMSINDOORPEOPLEDETECTOR_INTERFACE_INCLUDE_DIR
  KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
  KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_GENERATED_INCLUDE_DIR
  KMSINDOORPEOPLEDETECTOR_IMPLEMENTATION_EXTRA_INCLUDE_DIR
  KMSINDOORPEOPLEDETECTOR_INTERFACE_EXTRA_INCLUDE_DIR
  KMSINDOORPEOPLEDETECTOR_INCLUDE_DIRS
  KMSINDOORPEOPLEDETECTOR_LIBRARY
  KMSINDOORPEOPLEDETECTOR_LIBRARIES
)
