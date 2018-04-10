cmake_minimum_required (VERSION 2.8)

include (CodeGenerator)

set(SOURCES 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/SuBSENSE.cpp 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/BackgroundSubtractorSuBSENSE.cpp 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/BackgroundSubtractorLBSP.cpp 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/LBSP.cpp
)

set(HEADERS 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/SuBSENSE.h 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/IBGS.h 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/BackgroundSubtractorSuBSENSE.h 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/BackgroundSubtractorLBSP.h 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/LBSP.h 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/DistanceUtils.h 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl/RandUtils.h
)

set(DIRS 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs/pl 
  /path/to/kurento/MediaAlgorithms/ExternalDependencies/bgslibrary-master/package_bgs
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
