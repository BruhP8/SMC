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
include examples/sysc/pipe/CMakeFiles/pipe.dir/depend.make

# Include the progress variables for this target.
include examples/sysc/pipe/CMakeFiles/pipe.dir/progress.make

# Include the compile flags for this target's objects.
include examples/sysc/pipe/CMakeFiles/pipe.dir/flags.make

examples/sysc/pipe/CMakeFiles/pipe.dir/main.cpp.o: examples/sysc/pipe/CMakeFiles/pipe.dir/flags.make
examples/sysc/pipe/CMakeFiles/pipe.dir/main.cpp.o: ../examples/sysc/pipe/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/sysc/pipe/CMakeFiles/pipe.dir/main.cpp.o"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipe.dir/main.cpp.o -c /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/main.cpp

examples/sysc/pipe/CMakeFiles/pipe.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipe.dir/main.cpp.i"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/main.cpp > CMakeFiles/pipe.dir/main.cpp.i

examples/sysc/pipe/CMakeFiles/pipe.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipe.dir/main.cpp.s"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/main.cpp -o CMakeFiles/pipe.dir/main.cpp.s

examples/sysc/pipe/CMakeFiles/pipe.dir/display.cpp.o: examples/sysc/pipe/CMakeFiles/pipe.dir/flags.make
examples/sysc/pipe/CMakeFiles/pipe.dir/display.cpp.o: ../examples/sysc/pipe/display.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object examples/sysc/pipe/CMakeFiles/pipe.dir/display.cpp.o"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipe.dir/display.cpp.o -c /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/display.cpp

examples/sysc/pipe/CMakeFiles/pipe.dir/display.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipe.dir/display.cpp.i"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/display.cpp > CMakeFiles/pipe.dir/display.cpp.i

examples/sysc/pipe/CMakeFiles/pipe.dir/display.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipe.dir/display.cpp.s"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/display.cpp -o CMakeFiles/pipe.dir/display.cpp.s

examples/sysc/pipe/CMakeFiles/pipe.dir/numgen.cpp.o: examples/sysc/pipe/CMakeFiles/pipe.dir/flags.make
examples/sysc/pipe/CMakeFiles/pipe.dir/numgen.cpp.o: ../examples/sysc/pipe/numgen.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object examples/sysc/pipe/CMakeFiles/pipe.dir/numgen.cpp.o"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipe.dir/numgen.cpp.o -c /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/numgen.cpp

examples/sysc/pipe/CMakeFiles/pipe.dir/numgen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipe.dir/numgen.cpp.i"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/numgen.cpp > CMakeFiles/pipe.dir/numgen.cpp.i

examples/sysc/pipe/CMakeFiles/pipe.dir/numgen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipe.dir/numgen.cpp.s"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/numgen.cpp -o CMakeFiles/pipe.dir/numgen.cpp.s

examples/sysc/pipe/CMakeFiles/pipe.dir/stage1.cpp.o: examples/sysc/pipe/CMakeFiles/pipe.dir/flags.make
examples/sysc/pipe/CMakeFiles/pipe.dir/stage1.cpp.o: ../examples/sysc/pipe/stage1.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object examples/sysc/pipe/CMakeFiles/pipe.dir/stage1.cpp.o"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipe.dir/stage1.cpp.o -c /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage1.cpp

examples/sysc/pipe/CMakeFiles/pipe.dir/stage1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipe.dir/stage1.cpp.i"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage1.cpp > CMakeFiles/pipe.dir/stage1.cpp.i

examples/sysc/pipe/CMakeFiles/pipe.dir/stage1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipe.dir/stage1.cpp.s"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage1.cpp -o CMakeFiles/pipe.dir/stage1.cpp.s

examples/sysc/pipe/CMakeFiles/pipe.dir/stage2.cpp.o: examples/sysc/pipe/CMakeFiles/pipe.dir/flags.make
examples/sysc/pipe/CMakeFiles/pipe.dir/stage2.cpp.o: ../examples/sysc/pipe/stage2.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object examples/sysc/pipe/CMakeFiles/pipe.dir/stage2.cpp.o"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipe.dir/stage2.cpp.o -c /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage2.cpp

examples/sysc/pipe/CMakeFiles/pipe.dir/stage2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipe.dir/stage2.cpp.i"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage2.cpp > CMakeFiles/pipe.dir/stage2.cpp.i

examples/sysc/pipe/CMakeFiles/pipe.dir/stage2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipe.dir/stage2.cpp.s"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage2.cpp -o CMakeFiles/pipe.dir/stage2.cpp.s

examples/sysc/pipe/CMakeFiles/pipe.dir/stage3.cpp.o: examples/sysc/pipe/CMakeFiles/pipe.dir/flags.make
examples/sysc/pipe/CMakeFiles/pipe.dir/stage3.cpp.o: ../examples/sysc/pipe/stage3.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object examples/sysc/pipe/CMakeFiles/pipe.dir/stage3.cpp.o"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pipe.dir/stage3.cpp.o -c /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage3.cpp

examples/sysc/pipe/CMakeFiles/pipe.dir/stage3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pipe.dir/stage3.cpp.i"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage3.cpp > CMakeFiles/pipe.dir/stage3.cpp.i

examples/sysc/pipe/CMakeFiles/pipe.dir/stage3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pipe.dir/stage3.cpp.s"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe/stage3.cpp -o CMakeFiles/pipe.dir/stage3.cpp.s

# Object files for target pipe
pipe_OBJECTS = \
"CMakeFiles/pipe.dir/main.cpp.o" \
"CMakeFiles/pipe.dir/display.cpp.o" \
"CMakeFiles/pipe.dir/numgen.cpp.o" \
"CMakeFiles/pipe.dir/stage1.cpp.o" \
"CMakeFiles/pipe.dir/stage2.cpp.o" \
"CMakeFiles/pipe.dir/stage3.cpp.o"

# External object files for target pipe
pipe_EXTERNAL_OBJECTS =

examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/main.cpp.o
examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/display.cpp.o
examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/numgen.cpp.o
examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/stage1.cpp.o
examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/stage2.cpp.o
examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/stage3.cpp.o
examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/build.make
examples/sysc/pipe/pipe: src/libsystemc.so.2.3.3
examples/sysc/pipe/pipe: examples/sysc/pipe/CMakeFiles/pipe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable pipe"
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pipe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/sysc/pipe/CMakeFiles/pipe.dir/build: examples/sysc/pipe/pipe

.PHONY : examples/sysc/pipe/CMakeFiles/pipe.dir/build

examples/sysc/pipe/CMakeFiles/pipe.dir/clean:
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe && $(CMAKE_COMMAND) -P CMakeFiles/pipe.dir/cmake_clean.cmake
.PHONY : examples/sysc/pipe/CMakeFiles/pipe.dir/clean

examples/sysc/pipe/CMakeFiles/pipe.dir/depend:
	cd /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3 /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/examples/sysc/pipe /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe /home/iamgron/Documents/Fac/M2/SMC/systemc-2.3.3/build/examples/sysc/pipe/CMakeFiles/pipe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/sysc/pipe/CMakeFiles/pipe.dir/depend

