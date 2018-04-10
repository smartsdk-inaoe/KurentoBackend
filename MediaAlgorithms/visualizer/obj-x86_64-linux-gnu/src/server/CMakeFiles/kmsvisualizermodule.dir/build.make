# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_SOURCE_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu

# Include any dependencies generated for this target.
include src/server/CMakeFiles/kmsvisualizermodule.dir/depend.make

# Include the progress variables for this target.
include src/server/CMakeFiles/kmsvisualizermodule.dir/progress.make

# Include the compile flags for this target's objects.
include src/server/CMakeFiles/kmsvisualizermodule.dir/flags.make

src/server/cpp_module.generated: ../src/server/interface/visualizer.Visualizer.kmd.json
src/server/cpp_module.generated: ../src/server/interface/visualizer.kmd.json
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating cpp_module.generated, implementation/generated-cpp/Module.cpp"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/cmake -E touch cpp_module.generated
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/kurento-module-creator -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/implementation/generated-cpp -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/src/server/interface -dr /usr/share/kurento/modules -dr /usr/share/kurento/modules -it cpp_module

src/server/implementation/generated-cpp/Module.cpp: src/server/cpp_module.generated

src/server/visualizer.kmd.json: ../src/server/interface/visualizer.Visualizer.kmd.json
src/server/visualizer.kmd.json: ../src/server/interface/visualizer.kmd.json
src/server/visualizer.kmd.json: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/source/VPDetector.cpp
src/server/visualizer.kmd.json: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp
src/server/visualizer.kmd.json: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/VPDetector/include/VPDetector.hpp
src/server/visualizer.kmd.json: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.h
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating visualizer.kmd.json"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/cmake -P /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/generate_kmd_include.cmake

src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o: src/server/CMakeFiles/kmsvisualizermodule.dir/flags.make
src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o: src/server/implementation/generated-cpp/Module.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/implementation/generated-cpp/Module.cpp

src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/implementation/generated-cpp/Module.cpp > CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.i

src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/implementation/generated-cpp/Module.cpp -o CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.s

src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.requires

src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.provides: src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsvisualizermodule.dir/build.make src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.provides

src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.provides.build: src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o

src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o: src/server/CMakeFiles/kmsvisualizermodule.dir/flags.make
src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o: src/server/module_version.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_version.cpp

src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_version.cpp > CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.i

src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_version.cpp -o CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.s

src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.requires

src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.provides: src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsvisualizermodule.dir/build.make src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.provides

src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.provides.build: src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o

src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o: src/server/CMakeFiles/kmsvisualizermodule.dir/flags.make
src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o: src/server/module_name.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_name.cpp

src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_name.cpp > CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.i

src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_name.cpp -o CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.s

src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.requires

src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.provides: src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsvisualizermodule.dir/build.make src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.provides

src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.provides.build: src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o

src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o: src/server/CMakeFiles/kmsvisualizermodule.dir/flags.make
src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o: src/server/module_descriptor.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_descriptor.cpp

src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_descriptor.cpp > CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.i

src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_descriptor.cpp -o CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.s

src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.requires

src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.provides: src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsvisualizermodule.dir/build.make src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.provides

src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.provides.build: src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o

src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o: src/server/CMakeFiles/kmsvisualizermodule.dir/flags.make
src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o: src/server/module_generation_time.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_generation_time.cpp

src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_generation_time.cpp > CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.i

src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && /usr/bin/x86_64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/module_generation_time.cpp -o CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.s

src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.requires

src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.provides: src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsvisualizermodule.dir/build.make src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.provides

src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.provides.build: src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o

# Object files for target kmsvisualizermodule
kmsvisualizermodule_OBJECTS = \
"CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o" \
"CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o" \
"CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o" \
"CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o" \
"CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o"

# External object files for target kmsvisualizermodule
kmsvisualizermodule_EXTERNAL_OBJECTS =

src/server/libkmsvisualizermodule.so: src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o
src/server/libkmsvisualizermodule.so: src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o
src/server/libkmsvisualizermodule.so: src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o
src/server/libkmsvisualizermodule.so: src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o
src/server/libkmsvisualizermodule.so: src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o
src/server/libkmsvisualizermodule.so: src/server/CMakeFiles/kmsvisualizermodule.dir/build.make
src/server/libkmsvisualizermodule.so: src/server/libkmsvisualizerimpl.so.0.0.1~0.g6c4fbcc
src/server/libkmsvisualizermodule.so: src/server/libkmsvisualizerinterface.a
src/server/libkmsvisualizermodule.so: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsvisualizermodule.so: /usr/lib/x86_64-linux-gnu/libkmsfiltersimpl.so
src/server/libkmsvisualizermodule.so: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsvisualizermodule.so: /usr/lib/x86_64-linux-gnu/libkmsfiltersimpl.so
src/server/libkmsvisualizermodule.so: src/server/CMakeFiles/kmsvisualizermodule.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module libkmsvisualizermodule.so"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kmsvisualizermodule.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/server/CMakeFiles/kmsvisualizermodule.dir/build: src/server/libkmsvisualizermodule.so
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/build

src/server/CMakeFiles/kmsvisualizermodule.dir/requires: src/server/CMakeFiles/kmsvisualizermodule.dir/implementation/generated-cpp/Module.cpp.o.requires
src/server/CMakeFiles/kmsvisualizermodule.dir/requires: src/server/CMakeFiles/kmsvisualizermodule.dir/module_version.cpp.o.requires
src/server/CMakeFiles/kmsvisualizermodule.dir/requires: src/server/CMakeFiles/kmsvisualizermodule.dir/module_name.cpp.o.requires
src/server/CMakeFiles/kmsvisualizermodule.dir/requires: src/server/CMakeFiles/kmsvisualizermodule.dir/module_descriptor.cpp.o.requires
src/server/CMakeFiles/kmsvisualizermodule.dir/requires: src/server/CMakeFiles/kmsvisualizermodule.dir/module_generation_time.cpp.o.requires
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/requires

src/server/CMakeFiles/kmsvisualizermodule.dir/clean:
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server && $(CMAKE_COMMAND) -P CMakeFiles/kmsvisualizermodule.dir/cmake_clean.cmake
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/clean

src/server/CMakeFiles/kmsvisualizermodule.dir/depend: src/server/cpp_module.generated
src/server/CMakeFiles/kmsvisualizermodule.dir/depend: src/server/implementation/generated-cpp/Module.cpp
src/server/CMakeFiles/kmsvisualizermodule.dir/depend: src/server/visualizer.kmd.json
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/visualizer/obj-x86_64-linux-gnu/src/server/CMakeFiles/kmsvisualizermodule.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/server/CMakeFiles/kmsvisualizermodule.dir/depend

