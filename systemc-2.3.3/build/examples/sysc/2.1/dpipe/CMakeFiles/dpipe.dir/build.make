# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build

# Include any dependencies generated for this target.
include examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/depend.make

# Include the progress variables for this target.
include examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/progress.make

# Include the compile flags for this target's objects.
include examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/flags.make

examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/main.cpp.o: examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/flags.make
examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/main.cpp.o: ../examples/sysc/2.1/dpipe/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/main.cpp.o"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/dpipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dpipe.dir/main.cpp.o -c /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/dpipe/main.cpp

examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dpipe.dir/main.cpp.i"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/dpipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/dpipe/main.cpp > CMakeFiles/dpipe.dir/main.cpp.i

examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dpipe.dir/main.cpp.s"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/dpipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/dpipe/main.cpp -o CMakeFiles/dpipe.dir/main.cpp.s

# Object files for target dpipe
dpipe_OBJECTS = \
"CMakeFiles/dpipe.dir/main.cpp.o"

# External object files for target dpipe
dpipe_EXTERNAL_OBJECTS =

examples/sysc/2.1/dpipe/dpipe: examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/main.cpp.o
examples/sysc/2.1/dpipe/dpipe: examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/build.make
examples/sysc/2.1/dpipe/dpipe: src/libsystemc.so.2.3.3
examples/sysc/2.1/dpipe/dpipe: examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dpipe"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/dpipe && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dpipe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/build: examples/sysc/2.1/dpipe/dpipe

.PHONY : examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/build

examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/clean:
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/dpipe && $(CMAKE_COMMAND) -P CMakeFiles/dpipe.dir/cmake_clean.cmake
.PHONY : examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/clean

examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/depend:
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3 /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/2.1/dpipe /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/dpipe /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/sysc/2.1/dpipe/CMakeFiles/dpipe.dir/depend
