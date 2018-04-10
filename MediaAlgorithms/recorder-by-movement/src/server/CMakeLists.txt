cmake_minimum_required (VERSION 2.8)

include (CodeGenerator)
set(SOURCES
/path/to/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp
)

set(HEADERS
/path/to/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.h
/usr/include/python2.7/Python.h
/usr/include/x86_64-linux-gnu/python2.7/pyconfig.h
)

set(DIRS
/path/to/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master
/usr/include/python2.7
/usr/include/x86_64-linux-gnu/python2.7
)

set(LIBS
/usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0
)


generate_code (
  MODELS ${CMAKE_CURRENT_SOURCE_DIR}/interface
  SERVER_STUB_DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/implementation/objects

#------------------------------------------------------------------------------------
  SERVER_IMPL_LIB_EXTRA_SOURCES ${SOURCES}

  SERVER_IMPL_LIB_EXTRA_HEADERS ${HEADERS}

  SERVER_IMPL_LIB_EXTRA_INCLUDE_DIRS ${DIRS}

  SERVER_IMPL_LIB_EXTRA_LIBRARIES ${LIBS}
  #------------------------------------------------------------------------------------
  MODULE_EXTRA_INCLUDE_DIRS ${DIRS}

  MODULE_EXTRA_LIBRARIES ${LIBS}
)
