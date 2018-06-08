cmake_minimum_required (VERSION 2.8)

include (CodeGenerator)

set(SOURCES 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/BackgroundSubtractorSuBSENSE.cpp 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/BackgroundSubtractorLBSP.cpp 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/LBSP.cpp
)

set(HEADERS 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/IBGS.h 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/BackgroundSubtractorSuBSENSE.h 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/BackgroundSubtractorLBSP.h 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/LBSP.h 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/DistanceUtils.h 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP/RandUtils.h
)

set(DIRS 
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs/LBSP
  /path/to/KurentoBackend/MediaAlgorithms/ExternalDependencies/bgslibrary/package_bgs
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
