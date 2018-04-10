# - Try to find KMSRECORDERBYMOVEMENT library

#=============================================================================
# Copyright 2014 Kurento
#
#=============================================================================

set(PACKAGE_VERSION "0.0.1~0.gb91ede0")
set(KMSRECORDERBYMOVEMENT_VERSION ${PACKAGE_VERSION})

message (STATUS "Looking for KMSRECORDERBYMOVEMENT: 0.0.1~0.gb91ede0")

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
  KMSRECORDERBYMOVEMENT_VERSION
  KMSRECORDERBYMOVEMENT_INCLUDE_DIRS
  KMSRECORDERBYMOVEMENT_LIBRARY
  KMSRECORDERBYMOVEMENT_LIBRARIES
)

set (KMSRECORDERBYMOVEMENT_BINARY_DIR_PREFIX "build" CACHE PATH "Path prefix used to look for binary files")
set (KMSRECORDERBYMOVEMENT_SOURCE_DIR_PREFIX "" CACHE PATH "Path prefix used to look for source files")

set(KMSRECORDERBYMOVEMENT_INCLUDE_DIRS
  ${KMSCORE_INCLUDE_DIRS}
  ${KMSELEMENTS_INCLUDE_DIRS}
  ${KMSFILTERS_INCLUDE_DIRS}
)

if (NOT "RecorderByMovement.hpp RecorderByMovementInternal.hpp" STREQUAL " ")
  if (TARGET kmsrecorderbymovementinterface)
    set (KMSRECORDERBYMOVEMENT_INTERFACE_INCLUDE_DIR "${KMSRECORDERBYMOVEMENT_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp")
  else ()
    find_path(KMSRECORDERBYMOVEMENT_INTERFACE_INCLUDE_DIR
      NAMES
        RecorderByMovement.hpp
        RecorderByMovementInternal.hpp
      PATH_SUFFIXES
        ${KMSRECORDERBYMOVEMENT_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp
        kurento/modules/recorderbymovement
    )
  endif ()

  list (APPEND KMSRECORDERBYMOVEMENT_INCLUDE_DIRS ${KMSRECORDERBYMOVEMENT_INTERFACE_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSRECORDERBYMOVEMENT_INTERFACE_INCLUDE_DIR)
endif ()

if (NOT "RecorderByMovementImplFactory.hpp" STREQUAL "")
  if (TARGET kmsrecorderbymovementimpl)
    set (KMSRECORDERBYMOVEMENT_IMPLEMENTATION_INTERNAL_INCLUDE_DIR "${KMSRECORDERBYMOVEMENT_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp")
  else ()
    find_path(KMSRECORDERBYMOVEMENT_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
      NAMES
        RecorderByMovementImplFactory.hpp
      PATH_SUFFIXES
        ${KMSRECORDERBYMOVEMENT_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp
        kurento/modules/recorderbymovement
    )
  endif ()

  list (APPEND KMSRECORDERBYMOVEMENT_INCLUDE_DIRS ${KMSRECORDERBYMOVEMENT_IMPLEMENTATION_INTERNAL_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSRECORDERBYMOVEMENT_IMPLEMENTATION_INTERNAL_INCLUDE_DIR)
endif ()

if (NOT "RecorderByMovementOpenCVImpl.hpp RecorderByMovementImpl.hpp" STREQUAL "")
  if (TARGET kmsrecorderbymovementimpl)
    set (KMSRECORDERBYMOVEMENT_IMPLEMENTATION_GENERATED_INCLUDE_DIR "${KMSRECORDERBYMOVEMENT_SOURCE_DIR_PREFIX}/src/server/implementation/objects")
  else ()
    find_path(KMSRECORDERBYMOVEMENT_IMPLEMENTATION_GENERATED_INCLUDE_DIR
      NAMES
        RecorderByMovementOpenCVImpl.hpp RecorderByMovementImpl.hpp
      PATH_SUFFIXES
        src/server/implementation/objects
        kurento/modules/recorderbymovement
    )
  endif ()

  list (APPEND KMSRECORDERBYMOVEMENT_INCLUDE_DIRS ${KMSRECORDERBYMOVEMENT_IMPLEMENTATION_GENERATED_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSRECORDERBYMOVEMENT_IMPLEMENTATION_GENERATED_INCLUDE_DIR)
endif()

if (NOT "tinyxml2.h Python.h pyconfig.h" STREQUAL "")
  if (TARGET kmsrecorderbymovementimpl)
    set (KMSRECORDERBYMOVEMENT_IMPLEMENTATION_EXTRA_INCLUDE_DIR "${KMSRECORDERBYMOVEMENT_SOURCE_DIR_PREFIX}/src/server/")
  else ()
    find_path(KMSRECORDERBYMOVEMENT_IMPLEMENTATION_EXTRA_INCLUDE_DIR
      NAMES
        tinyxml2.h Python.h pyconfig.h
      PATH_SUFFIXES
        src/server/
        kurento/modules/recorderbymovement
    )
  endif ()

  list (APPEND KMSRECORDERBYMOVEMENT_INCLUDE_DIRS ${KMSRECORDERBYMOVEMENT_IMPLEMENTATION_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSRECORDERBYMOVEMENT_IMPLEMENTATION_EXTRA_INCLUDE_DIR)
endif ()

if (NOT "" STREQUAL "")
  if (TARGET kmsrecorderbymovementinterface)
    set (KMSRECORDERBYMOVEMENT_INTERFACE_EXTRA_INCLUDE_DIR "${KMSRECORDERBYMOVEMENT_SOURCE_DIR_PREFIX}/")
  else ()
    find_path(KMSRECORDERBYMOVEMENT_INTERFACE_EXTRA_INCLUDE_DIR
      NAMES
        
      PATH_SUFFIXES
        
        kurento/modules/recorderbymovement
    )
  endif()

  list (APPEND KMSRECORDERBYMOVEMENT_INCLUDE_DIRS ${KMSRECORDERBYMOVEMENT_INTERFACE_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSRECORDERBYMOVEMENT_INTERFACE_EXTRA_INCLUDE_DIR)
endif ()

if (TARGET kmsrecorderbymovementimpl)
  set (KMSRECORDERBYMOVEMENT_LIBRARY kmsrecorderbymovementimpl)
else ()
  find_library (KMSRECORDERBYMOVEMENT_LIBRARY
    NAMES
      kmsrecorderbymovementimpl
    PATH_SUFFIXES
      ${KMSRECORDERBYMOVEMENT_BINARY_DIR_PREFIX}/src/server
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
  list (APPEND KMSRECORDERBYMOVEMENT_INCLUDE_DIRS ${${LIB_NAME}_INCLUDE_DIRS})

endforeach()

set(KMSRECORDERBYMOVEMENT_INCLUDE_DIRS
  ${KMSRECORDERBYMOVEMENT_INCLUDE_DIRS}
  CACHE INTERNAL "Include directories for KMSRECORDERBYMOVEMENT library" FORCE
)

set (KMSRECORDERBYMOVEMENT_LIBRARIES
  ${KMSRECORDERBYMOVEMENT_LIBRARY}
  ${KMSCORE_LIBRARIES}
  ${KMSELEMENTS_LIBRARIES}
  ${KMSFILTERS_LIBRARIES}
  ${REQUIRED_LIBRARIES}
  CACHE INTERNAL "Libraries for KMSRECORDERBYMOVEMENT" FORCE
)

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args(KMSRECORDERBYMOVEMENT
  FOUND_VAR
    KMSRECORDERBYMOVEMENT_FOUND
  REQUIRED_VARS
    ${REQUIRED_VARS}
  VERSION_VAR
    KMSRECORDERBYMOVEMENT_VERSION
)

mark_as_advanced(
  KMSRECORDERBYMOVEMENT_FOUND
  KMSRECORDERBYMOVEMENT_VERSION
  KMSRECORDERBYMOVEMENT_INTERFACE_INCLUDE_DIR
  KMSRECORDERBYMOVEMENT_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
  KMSRECORDERBYMOVEMENT_IMPLEMENTATION_GENERATED_INCLUDE_DIR
  KMSRECORDERBYMOVEMENT_IMPLEMENTATION_EXTRA_INCLUDE_DIR
  KMSRECORDERBYMOVEMENT_INTERFACE_EXTRA_INCLUDE_DIR
  KMSRECORDERBYMOVEMENT_INCLUDE_DIRS
  KMSRECORDERBYMOVEMENT_LIBRARY
  KMSRECORDERBYMOVEMENT_LIBRARIES
)