# Copyright 2011 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

########################################################################
# Setup includes and linker paths
########################################################################
include_directories(
    ${GNURADIO_CORE_INCLUDE_DIRS}
    ${GR_UHD_INCLUDE_DIRS}
    ${GR_ASAT_INCLUDE_DIRS}
)


include_directories(${UHD_INCLUDE_DIRS})
link_directories(${UHD_LIBRARY_DIRS})

include_directories(${ASAT_INCLUDE_DIRS})
link_directories(${ASAT_LIBRARY_DIRS})

include_directories(${Boost_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIRS})

########################################################################
# Setup library
########################################################################
include(GrPlatform) #define LIB_SUFFIX

list(APPEND asat_libs
    gnuradio-core
    gnuradio-uhd
    ${ASAT_LIBRARIES}
    ${Boost_LIBRARIES}
    ${UHD_LIBRARIES}
)

add_library(gnuradio-asat SHARED asat_transcv_ff.cc)
target_link_libraries(gnuradio-asat uhd ${asat_libs})

########################################################################
# Install built library files
########################################################################
install(TARGETS gnuradio-asat
    LIBRARY DESTINATION lib${LIB_SUFFIX} # .so/.dylib file
    ARCHIVE DESTINATION lib${LIB_SUFFIX} # .lib file
    RUNTIME DESTINATION bin              # .dll file
)

########################################################################
# Build and register unit test
########################################################################
find_package(Boost COMPONENTS unit_test_framework)

include(GrTest)
set(GR_TEST_TARGET_DEPS gnuradio-asat)
#turn each test cpp file into an executable with an int main() function
add_definitions(-DBOOST_TEST_DYN_LINK -DBOOST_TEST_MAIN )
