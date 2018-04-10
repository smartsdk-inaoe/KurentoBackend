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
include src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/depend.make

# Include the progress variables for this target.
include src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/progress.make

# Include the compile flags for this target's objects.
include src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/flags.make

src/server/cpp_server_internal.generated: ../src/server/interface/outdoorpeopledetector.kmd.json
src/server/cpp_server_internal.generated: ../src/server/interface/outdoorpeopledetector.OutdoorPeopleDetector.kmd.json
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating cpp_server_internal.generated, implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp, implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp, implementation/generated-cpp/OutdoorPeopleDetectorImplFactory.hpp"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/cmake -E touch cpp_server_internal.generated
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/kurento-module-creator -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/implementation/generated-cpp -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/interface -dr /usr/share/kurento/modules -dr /usr/share/kurento/modules -it cpp_server_internal

src/server/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp: src/server/cpp_server_internal.generated

src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp: src/server/cpp_server_internal.generated

src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplFactory.hpp: src/server/cpp_server_internal.generated

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp > CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp > CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o: ../src/server/implementation/objects/OutdoorPeopleDetectorImpl.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/implementation/objects/OutdoorPeopleDetectorImpl.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/implementation/objects/OutdoorPeopleDetectorImpl.cpp > CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/implementation/objects/OutdoorPeopleDetectorImpl.cpp -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o: ../src/server/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp > CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o: src/server/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp > CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/flags.make
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o: src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp > CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.i

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp -o CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.s

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.provides: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build.make src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.provides

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.provides.build: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o

# Object files for target kmsoutdoorpeopledetectorimpl
kmsoutdoorpeopledetectorimpl_OBJECTS = \
"CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o" \
"CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o" \
"CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o" \
"CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o" \
"CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o" \
"CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o"

# External object files for target kmsoutdoorpeopledetectorimpl
kmsoutdoorpeopledetectorimpl_EXTERNAL_OBJECTS =

src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build.make
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: /usr/lib/x86_64-linux-gnu/libkmsfiltersimpl.so
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/libkmsoutdoorpeopledetectorinterface.a
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: /usr/lib/x86_64-linux-gnu/libkmsfiltersimpl.so
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: /usr/lib/x86_64-linux-gnu/libkmsfiltersimpl.so
src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libkmsoutdoorpeopledetectorimpl.so"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/link.txt --verbose=$(VERBOSE)
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && $(CMAKE_COMMAND) -E cmake_symlink_library "libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e" libkmsoutdoorpeopledetectorimpl.so.0 libkmsoutdoorpeopledetectorimpl.so

src/server/libkmsoutdoorpeopledetectorimpl.so.0: src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e

src/server/libkmsoutdoorpeopledetectorimpl.so: src/server/libkmsoutdoorpeopledetectorimpl.so.0.0.1~0.g93ece1e

# Rule to build all files generated by this target.
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build: src/server/libkmsoutdoorpeopledetectorimpl.so
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/build

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp.o.requires
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp.o.requires
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorImpl.cpp.o.requires
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/objects/OutdoorPeopleDetectorOpenCVImpl.cpp.o.requires
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp.o.requires
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/requires: src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp.o.requires
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/requires

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/clean:
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server && $(CMAKE_COMMAND) -P CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/cmake_clean.cmake
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/clean

src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/depend: src/server/cpp_server_internal.generated
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/depend: src/server/implementation/generated-cpp/SerializerExpanderOutdoorpeopledetector.cpp
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/depend: src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplInternal.cpp
src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/depend: src/server/implementation/generated-cpp/OutdoorPeopleDetectorImplFactory.hpp
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/outdoor-people-detector/build/src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/server/CMakeFiles/kmsoutdoorpeopledetectorimpl.dir/depend
