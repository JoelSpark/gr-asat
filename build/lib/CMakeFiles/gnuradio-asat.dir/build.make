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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/joel/GNURadio/SRC/gnuradio/gr-asat

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/joel/GNURadio/SRC/gnuradio/gr-asat/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/gnuradio-asat.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/gnuradio-asat.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/gnuradio-asat.dir/flags.make

lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o: lib/CMakeFiles/gnuradio-asat.dir/flags.make
lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o: ../lib/asat_transcv_ff.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o"
	cd /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o -c /home/joel/GNURadio/SRC/gnuradio/gr-asat/lib/asat_transcv_ff.cc

lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.i"
	cd /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/joel/GNURadio/SRC/gnuradio/gr-asat/lib/asat_transcv_ff.cc > CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.i

lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.s"
	cd /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/joel/GNURadio/SRC/gnuradio/gr-asat/lib/asat_transcv_ff.cc -o CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.s

lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.requires:
.PHONY : lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.requires

lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.provides: lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/gnuradio-asat.dir/build.make lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.provides.build
.PHONY : lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.provides

lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.provides.build: lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o

# Object files for target gnuradio-asat
gnuradio__asat_OBJECTS = \
"CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o"

# External object files for target gnuradio-asat
gnuradio__asat_EXTERNAL_OBJECTS =

lib/libgnuradio-asat.so: lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o
lib/libgnuradio-asat.so: lib/CMakeFiles/gnuradio-asat.dir/build.make
lib/libgnuradio-asat.so: lib/CMakeFiles/gnuradio-asat.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libgnuradio-asat.so"
	cd /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gnuradio-asat.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/gnuradio-asat.dir/build: lib/libgnuradio-asat.so
.PHONY : lib/CMakeFiles/gnuradio-asat.dir/build

lib/CMakeFiles/gnuradio-asat.dir/requires: lib/CMakeFiles/gnuradio-asat.dir/asat_transcv_ff.cc.o.requires
.PHONY : lib/CMakeFiles/gnuradio-asat.dir/requires

lib/CMakeFiles/gnuradio-asat.dir/clean:
	cd /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/gnuradio-asat.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/gnuradio-asat.dir/clean

lib/CMakeFiles/gnuradio-asat.dir/depend:
	cd /home/joel/GNURadio/SRC/gnuradio/gr-asat/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/joel/GNURadio/SRC/gnuradio/gr-asat /home/joel/GNURadio/SRC/gnuradio/gr-asat/lib /home/joel/GNURadio/SRC/gnuradio/gr-asat/build /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/lib /home/joel/GNURadio/SRC/gnuradio/gr-asat/build/lib/CMakeFiles/gnuradio-asat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/gnuradio-asat.dir/depend

