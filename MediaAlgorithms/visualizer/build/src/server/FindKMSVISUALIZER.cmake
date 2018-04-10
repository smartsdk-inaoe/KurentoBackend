# - Try to find KMSVISUALIZER library

#=============================================================================
# Copyright 2014 Kurento
#
#=============================================================================

set(PACKAGE_VERSION "0.0.1~0.g6c4fbcc")
set(KMSVISUALIZER_VERSION ${PACKAGE_VERSION})

message (STATUS "Looking for KMSVISUALIZER: 0.0.1~0.g6c4fbcc")

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
  KMSVISUALIZER_VERSION
  KMSVISUALIZER_INCLUDE_DIRS
  KMSVISUALIZER_LIBRARY
  KMSVISUALIZER_LIBRARIES
)

set (KMSVISUALIZER_BINARY_DIR_PREFIX "build" CACHE PATH "Path prefix used to look for binary files")
set (KMSVISUALIZER_SOURCE_DIR_PREFIX "" CACHE PATH "Path prefix used to look for source files")

set(KMSVISUALIZER_INCLUDE_DIRS
  ${KMSCORE_INCLUDE_DIRS}
  ${KMSELEMENTS_INCLUDE_DIRS}
  ${KMSFILTERS_INCLUDE_DIRS}
)

if (NOT "Visualizer.hpp VisualizerInternal.hpp" STREQUAL " ")
  if (TARGET kmsvisualizerinterface)
    set (KMSVISUALIZER_INTERFACE_INCLUDE_DIR "${KMSVISUALIZER_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp")
  else ()
    find_path(KMSVISUALIZER_INTERFACE_INCLUDE_DIR
      NAMES
        Visualizer.hpp
        VisualizerInternal.hpp
      PATH_SUFFIXES
        ${KMSVISUALIZER_BINARY_DIR_PREFIX}/src/server/interface/generated-cpp
        kurento/modules/visualizer
    )
  endif ()

  list (APPEND KMSVISUALIZER_INCLUDE_DIRS ${KMSVISUALIZER_INTERFACE_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSVISUALIZER_INTERFACE_INCLUDE_DIR)
endif ()

if (NOT "VisualizerImplFactory.hpp" STREQUAL "")
  if (TARGET kmsvisualizerimpl)
    set (KMSVISUALIZER_IMPLEMENTATION_INTERNAL_INCLUDE_DIR "${KMSVISUALIZER_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp")
  else ()
    find_path(KMSVISUALIZER_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
      NAMES
        VisualizerImplFactory.hpp
      PATH_SUFFIXES
        ${KMSVISUALIZER_BINARY_DIR_PREFIX}/src/server/implementation/generated-cpp
        kurento/modules/visualizer
    )
  endif ()

  list (APPEND KMSVISUALIZER_INCLUDE_DIRS ${KMSVISUALIZER_IMPLEMENTATION_INTERNAL_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSVISUALIZER_IMPLEMENTATION_INTERNAL_INCLUDE_DIR)
endif ()

if (NOT "VisualizerOpenCVImpl.hpp VisualizerImpl.hpp" STREQUAL "")
  if (TARGET kmsvisualizerimpl)
    set (KMSVISUALIZER_IMPLEMENTATION_GENERATED_INCLUDE_DIR "${KMSVISUALIZER_SOURCE_DIR_PREFIX}/src/server/implementation/objects")
  else ()
    find_path(KMSVISUALIZER_IMPLEMENTATION_GENERATED_INCLUDE_DIR
      NAMES
        VisualizerOpenCVImpl.hpp VisualizerImpl.hpp
      PATH_SUFFIXES
        src/server/implementation/objects
        kurento/modules/visualizer
    )
  endif ()

  list (APPEND KMSVISUALIZER_INCLUDE_DIRS ${KMSVISUALIZER_IMPLEMENTATION_GENERATED_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSVISUALIZER_IMPLEMENTATION_GENERATED_INCLUDE_DIR)
endif()

if (NOT "VPDetector.hpp tinyxml2.h" STREQUAL "")
  if (TARGET kmsvisualizerimpl)
    set (KMSVISUALIZER_IMPLEMENTATION_EXTRA_INCLUDE_DIR "${KMSVISUALIZER_SOURCE_DIR_PREFIX}/src/server/")
  else ()
    find_path(KMSVISUALIZER_IMPLEMENTATION_EXTRA_INCLUDE_DIR
      NAMES
        VPDetector.hpp tinyxml2.h
      PATH_SUFFIXES
        src/server/
        kurento/modules/visualizer
    )
  endif ()

  list (APPEND KMSVISUALIZER_INCLUDE_DIRS ${KMSVISUALIZER_IMPLEMENTATION_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSVISUALIZER_IMPLEMENTATION_EXTRA_INCLUDE_DIR)
endif ()

if (NOT "" STREQUAL "")
  if (TARGET kmsvisualizerinterface)
    set (KMSVISUALIZER_INTERFACE_EXTRA_INCLUDE_DIR "${KMSVISUALIZER_SOURCE_DIR_PREFIX}/")
  else ()
    find_path(KMSVISUALIZER_INTERFACE_EXTRA_INCLUDE_DIR
      NAMES
        
      PATH_SUFFIXES
        
        kurento/modules/visualizer
    )
  endif()

  list (APPEND KMSVISUALIZER_INCLUDE_DIRS ${KMSVISUALIZER_INTERFACE_EXTRA_INCLUDE_DIR})
  list (APPEND REQUIRED_VARS KMSVISUALIZER_INTERFACE_EXTRA_INCLUDE_DIR)
endif ()

if (TARGET kmsvisualizerimpl)
  set (KMSVISUALIZER_LIBRARY kmsvisualizerimpl)
else ()
  find_library (KMSVISUALIZER_LIBRARY
    NAMES
      kmsvisualizerimpl
    PATH_SUFFIXES
      ${KMSVISUALIZER_BINARY_DIR_PREFIX}/src/server
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
  list (APPEND KMSVISUALIZER_INCLUDE_DIRS ${${LIB_NAME}_INCLUDE_DIRS})

endforeach()

set(KMSVISUALIZER_INCLUDE_DIRS
  ${KMSVISUALIZER_INCLUDE_DIRS}
  CACHE INTERNAL "Include directories for KMSVISUALIZER library" FORCE
)

set (KMSVISUALIZER_LIBRARIES
  ${KMSVISUALIZER_LIBRARY}
  ${KMSCORE_LIBRARIES}
  ${KMSELEMENTS_LIBRARIES}
  ${KMSFILTERS_LIBRARIES}
  ${REQUIRED_LIBRARIES}
  CACHE INTERNAL "Libraries for KMSVISUALIZER" FORCE
)

include (FindPackageHandleStandardArgs)

find_package_handle_standard_args(KMSVISUALIZER
  FOUND_VAR
    KMSVISUALIZER_FOUND
  REQUIRED_VARS
    ${REQUIRED_VARS}
  VERSION_VAR
    KMSVISUALIZER_VERSION
)

mark_as_advanced(
  KMSVISUALIZER_FOUND
  KMSVISUALIZER_VERSION
  KMSVISUALIZER_INTERFACE_INCLUDE_DIR
  KMSVISUALIZER_IMPLEMENTATION_INTERNAL_INCLUDE_DIR
  KMSVISUALIZER_IMPLEMENTATION_GENERATED_INCLUDE_DIR
  KMSVISUALIZER_IMPLEMENTATION_EXTRA_INCLUDE_DIR
  KMSVISUALIZER_INTERFACE_EXTRA_INCLUDE_DIR
  KMSVISUALIZER_INCLUDE_DIRS
  KMSVISUALIZER_LIBRARY
  KMSVISUALIZER_LIBRARIES
)
