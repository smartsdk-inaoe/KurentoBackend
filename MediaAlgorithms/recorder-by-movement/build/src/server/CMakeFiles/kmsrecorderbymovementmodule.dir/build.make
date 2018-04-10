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
CMAKE_SOURCE_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build

# Include any dependencies generated for this target.
include src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/depend.make

# Include the progress variables for this target.
include src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/progress.make

# Include the compile flags for this target's objects.
include src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/flags.make

src/server/cpp_module.generated: ../src/server/interface/recorderbymovement.kmd.json
src/server/cpp_module.generated: ../src/server/interface/recorderbymovement.RecorderByMovement.kmd.json
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating cpp_module.generated, implementation/generated-cpp/Module.cpp"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/cmake -E touch cpp_module.generated
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/kurento-module-creator -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/implementation/generated-cpp -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/src/server/interface -dr /usr/share/kurento/modules -dr /usr/share/kurento/modules -it cpp_module

src/server/implementation/generated-cpp/Module.cpp: src/server/cpp_module.generated

src/server/recorderbymovement.kmd.json: ../src/server/interface/recorderbymovement.kmd.json
src/server/recorderbymovement.kmd.json: ../src/server/interface/recorderbymovement.RecorderByMovement.kmd.json
src/server/recorderbymovement.kmd.json: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.cpp
src/server/recorderbymovement.kmd.json: /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/ExternalDependencies/tinyxml2-master/tinyxml2.h
src/server/recorderbymovement.kmd.json: /usr/include/python2.7/Python.h
src/server/recorderbymovement.kmd.json: /usr/include/x86_64-linux-gnu/python2.7/pyconfig.h
src/server/recorderbymovement.kmd.json: /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0
src/server/recorderbymovement.kmd.json: /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating recorderbymovement.kmd.json"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/cmake -P /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/generate_kmd_include.cmake

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/flags.make
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o: src/server/implementation/generated-cpp/Module.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/implementation/generated-cpp/Module.cpp

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/implementation/generated-cpp/Module.cpp > CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.i

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/implementation/generated-cpp/Module.cpp -o CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.s

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.requires

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.provides: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build.make src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.provides

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.provides.build: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/flags.make
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o: src/server/module_version.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_version.cpp

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_version.cpp > CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.i

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_version.cpp -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.s

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.requires

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.provides: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build.make src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.provides

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.provides.build: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/flags.make
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o: src/server/module_name.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_name.cpp

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_name.cpp > CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.i

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_name.cpp -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.s

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.requires

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.provides: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build.make src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.provides

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.provides.build: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/flags.make
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o: src/server/module_descriptor.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_descriptor.cpp

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_descriptor.cpp > CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.i

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_descriptor.cpp -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.s

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.requires

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.provides: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build.make src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.provides

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.provides.build: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/flags.make
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o: src/server/module_generation_time.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o -c /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_generation_time.cpp

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.i"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_generation_time.cpp > CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.i

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.s"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/module_generation_time.cpp -o CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.s

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.requires:
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.requires

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.provides: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.requires
	$(MAKE) -f src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build.make src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.provides.build
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.provides

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.provides.build: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o

# Object files for target kmsrecorderbymovementmodule
kmsrecorderbymovementmodule_OBJECTS = \
"CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o" \
"CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o" \
"CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o" \
"CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o" \
"CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o"

# External object files for target kmsrecorderbymovementmodule
kmsrecorderbymovementmodule_EXTERNAL_OBJECTS =

src/server/libkmsrecorderbymovementmodule.so: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o
src/server/libkmsrecorderbymovementmodule.so: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o
src/server/libkmsrecorderbymovementmodule.so: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o
src/server/libkmsrecorderbymovementmodule.so: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o
src/server/libkmsrecorderbymovementmodule.so: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o
src/server/libkmsrecorderbymovementmodule.so: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build.make
src/server/libkmsrecorderbymovementmodule.so: src/server/libkmsrecorderbymovementimpl.so.0.0.1~0.gb91ede0
src/server/libkmsrecorderbymovementmodule.so: src/server/libkmsrecorderbymovementinterface.a
src/server/libkmsrecorderbymovementmodule.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0
src/server/libkmsrecorderbymovementmodule.so: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsrecorderbymovementmodule.so: /usr/lib/x86_64-linux-gnu/libkmsfiltersimpl.so
src/server/libkmsrecorderbymovementmodule.so: /usr/lib/x86_64-linux-gnu/libkmselementsimpl.so
src/server/libkmsrecorderbymovementmodule.so: /usr/lib/x86_64-linux-gnu/libkmsfiltersimpl.so
src/server/libkmsrecorderbymovementmodule.so: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module libkmsrecorderbymovementmodule.so"
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kmsrecorderbymovementmodule.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build: src/server/libkmsrecorderbymovementmodule.so
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/build

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/requires: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/implementation/generated-cpp/Module.cpp.o.requires
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/requires: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_version.cpp.o.requires
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/requires: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_name.cpp.o.requires
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/requires: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_descriptor.cpp.o.requires
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/requires: src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/module_generation_time.cpp.o.requires
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/requires

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/clean:
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server && $(CMAKE_COMMAND) -P CMakeFiles/kmsrecorderbymovementmodule.dir/cmake_clean.cmake
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/clean

src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/depend: src/server/cpp_module.generated
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/depend: src/server/implementation/generated-cpp/Module.cpp
src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/depend: src/server/recorderbymovement.kmd.json
	cd /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/recorder-by-movement/build/src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/server/CMakeFiles/kmsrecorderbymovementmodule.dir/depend

