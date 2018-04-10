# Autogenerated with kurento-module-creator
cmake_minimum_required(VERSION 2.8)

include (GenericFind)

###############################################################
# Dependencies
###############################################################
# looking for core dependencies
generic_find (
  REQUIRED
  LIBNAME KMSCORE
  VERSION ^6.0.0
)
# looking for elements dependencies
generic_find (
  REQUIRED
  LIBNAME KMSELEMENTS
  VERSION ^6.0.0
)
# looking for filters dependencies
generic_find (
  REQUIRED
  LIBNAME KMSFILTERS
  VERSION ^6.0.0
)

set (KMSINDOORPEOPLEDETECTOR_DEPENDENCIES_LIBRARIES
  ${KMSCORE_LIBRARIES}
  ${KMSELEMENTS_LIBRARIES}
  ${KMSFILTERS_LIBRARIES}
  CACHE INTERNAL "Model library dependencies"
)

set (KMSINDOORPEOPLEDETECTOR_DEPENDENCIES_INCLUDE_DIRS
  ${KMSCORE_INCLUDE_DIRS}
  ${KMSELEMENTS_INCLUDE_DIRS}
  ${KMSFILTERS_INCLUDE_DIRS}
  CACHE INTERNAL "Model library dependencies"
)
