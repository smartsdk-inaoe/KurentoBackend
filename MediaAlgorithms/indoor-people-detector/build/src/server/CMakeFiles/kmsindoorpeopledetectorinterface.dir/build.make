# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build

# Include any dependencies generated for this target.
include src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend.make

# Include the progress variables for this target.
include src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/progress.make

# Include the compile flags for this target's objects.
include src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/flags.make

src/server/cpp_interface_internal.generated: ../src/server/interface/indoorpeopledetector.IndoorPeopleDetector.kmd.json
src/server/cpp_interface_internal.generated: ../src/server/interface/indoorpeopledetector.kmd.json
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating cpp_interface_internal.generated, interface/generated-cpp/IndoorPeopleDetectorInternal.cpp, interface/generated-cpp/IndoorPeopleDetectorInternal.hpp"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/cmake -E touch cpp_interface_internal.generated
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/kurento-module-creator -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/src/server/interface -dr /usr/share/kurento/modules -dr /usr/share/kurento/modules -it cpp_interface_internal

src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp: src/server/cpp_interface_internal.generated

src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.hpp: src/server/cpp_interface_internal.generated

src/server/cpp_interface.generated: ../src/server/interface/indoorpeopledetector.IndoorPeopleDetector.kmd.json
src/server/cpp_interface.generated: ../src/server/interface/indoorpeopledetector.kmd.json
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating cpp_interface.generated, interface/generated-cpp/IndoorPeopleDetector.cpp, interface/generated-cpp/IndoorPeopleDetector.hpp"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/cmake -E touch cpp_interface.generated
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/kurento-module-creator -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/src/server/interface -dr /usr/share/kurento/modules -dr /usr/share/kurento/modules -it cpp_interface

src/server/interface/generated-cpp/IndoorPeopleDetector.cpp: src/server/cpp_interface.generated

src/server/interface/generated-cpp/IndoorPeopleDetector.hpp: src/server/cpp_interface.generated

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/flags.make
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o: src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp > CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.i

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp -o CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.s

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.requires

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.provides: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/build.make src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.provides

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.provides.build: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/flags.make
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o: src/server/interface/generated-cpp/IndoorPeopleDetector.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp/IndoorPeopleDetector.cpp

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp/IndoorPeopleDetector.cpp > CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.i

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/interface/generated-cpp/IndoorPeopleDetector.cpp -o CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.s

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.requires

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.provides: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/build.make src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.provides

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.provides.build: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o

# Object files for target kmsindoorpeopledetectorinterface
kmsindoorpeopledetectorinterface_OBJECTS = \
"CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o" \
"CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o"

# External object files for target kmsindoorpeopledetectorinterface
kmsindoorpeopledetectorinterface_EXTERNAL_OBJECTS =

src/server/libkmsindoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o
src/server/libkmsindoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o
src/server/libkmsindoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/build.make
src/server/libkmsindoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libkmsindoorpeopledetectorinterface.a"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && $(CMAKE_COMMAND) -P CMakeFiles/kmsindoorpeopledetectorinterface.dir/cmake_clean_target.cmake
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kmsindoorpeopledetectorinterface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/build: src/server/libkmsindoorpeopledetectorinterface.a
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/build

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/requires: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp.o.requires
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/requires: src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/interface/generated-cpp/IndoorPeopleDetector.cpp.o.requires
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/requires

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/clean:
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server && $(CMAKE_COMMAND) -P CMakeFiles/kmsindoorpeopledetectorinterface.dir/cmake_clean.cmake
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/clean

src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend: src/server/cpp_interface_internal.generated
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.cpp
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/IndoorPeopleDetectorInternal.hpp
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend: src/server/cpp_interface.generated
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/IndoorPeopleDetector.cpp
src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/IndoorPeopleDetector.hpp
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/indoor-people-detector/build/src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/server/CMakeFiles/kmsindoorpeopledetectorinterface.dir/depend
