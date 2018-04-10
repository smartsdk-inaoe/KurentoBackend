cmake_minimum_required (VERSION 2.8)

include (CodeGenerator)


set(SOURCES 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp
)

set(HEADERS 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/include/VPDetector.hpp
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.h
)

set(DIRS 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/include
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master
)

generate_code (
  MODELS ${CMAKE_CURRENT_SOURCE_DIR}/interface
  SERVER_STUB_DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/implementation/objects

  #------------------------------------------------------------------------------------
  SERVER_IMPL_LIB_EXTRA_SOURCES ${SOURCES}

  SERVER_IMPL_LIB_EXTRA_HEADERS ${HEADERS}

  SERVER_IMPL_LIB_EXTRA_INCLUDE_DIRS ${DIRS}

  #------------------------------------------------------------------------------------
  MODULE_EXTRA_INCLUDE_DIRS ${DIRS}

)
