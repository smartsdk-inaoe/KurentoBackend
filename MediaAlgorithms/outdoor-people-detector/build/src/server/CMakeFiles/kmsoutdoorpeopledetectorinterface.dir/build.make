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
CMAKE_SOURCE_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build

# Include any dependencies generated for this target.
include src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend.make

# Include the progress variables for this target.
include src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/progress.make

# Include the compile flags for this target's objects.
include src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/flags.make

src/server/cpp_interface_internal.generated: ../src/server/interface/outdoorpeopledetector.kmd.json
src/server/cpp_interface_internal.generated: ../src/server/interface/outdoorpeopledetector.OutdoorPeopleDetector.kmd.json
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating cpp_interface_internal.generated, interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp, interface/generated-cpp/OutdoorPeopleDetectorInternal.hpp"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/cmake -E touch cpp_interface_internal.generated
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/kurento-module-creator -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/interface -dr /usr/share/kurento/modules -dr /usr/share/kurento/modules -it cpp_interface_internal

src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp: src/server/cpp_interface_internal.generated

src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.hpp: src/server/cpp_interface_internal.generated

src/server/cpp_interface.generated: ../src/server/interface/outdoorpeopledetector.kmd.json
src/server/cpp_interface.generated: ../src/server/interface/outdoorpeopledetector.OutdoorPeopleDetector.kmd.json
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating cpp_interface.generated, interface/generated-cpp/OutdoorPeopleDetector.cpp, interface/generated-cpp/OutdoorPeopleDetector.hpp"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/cmake -E touch cpp_interface.generated
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/kurento-module-creator -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/interface -dr /usr/share/kurento/modules -dr /usr/share/kurento/modules -it cpp_interface

src/server/interface/generated-cpp/OutdoorPeopleDetector.cpp: src/server/cpp_interface.generated

src/server/interface/generated-cpp/OutdoorPeopleDetector.hpp: src/server/cpp_interface.generated

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o: src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp > CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp -o CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o: src/server/interface/generated-cpp/OutdoorPeopleDetector.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp/OutdoorPeopleDetector.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp/OutdoorPeopleDetector.cpp > CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/interface/generated-cpp/OutdoorPeopleDetector.cpp -o CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o

# Object files for target kmsoutdoorpeopledetectorinterface
kmsoutdoorpeopledetectorinterface_OBJECTS = \
"CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o" \
"CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o"

# External object files for target kmsoutdoorpeopledetectorinterface
kmsoutdoorpeopledetectorinterface_EXTERNAL_OBJECTS =

src/server/libkmsoutdoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o
src/server/libkmsoutdoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o
src/server/libkmsoutdoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/build.make
src/server/libkmsoutdoorpeopledetectorinterface.a: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libkmsoutdoorpeopledetectorinterface.a"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && $(CMAKE_COMMAND) -P CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/cmake_clean_target.cmake
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/build: src/server/libkmsoutdoorpeopledetectorinterface.a
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/build

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp.o.requires
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/interface/generated-cpp/OutdoorPeopleDetector.cpp.o.requires
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/clean:
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && $(CMAKE_COMMAND) -P CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/cmake_clean.cmake
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/clean

src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend: src/server/cpp_interface_internal.generated
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.cpp
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/OutdoorPeopleDetectorInternal.hpp
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend: src/server/cpp_interface.generated
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/OutdoorPeopleDetector.cpp
src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend: src/server/interface/generated-cpp/OutdoorPeopleDetector.hpp
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorinterface.dir/depend
