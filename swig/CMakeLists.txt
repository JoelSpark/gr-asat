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
# Add GnuRadio directories to search path
########################################################################

include_directories (/home/joel/GNURadio/SRC/gnuradio/gnuradio-core/src/lib/swig)
include_directories (/home/joel/GNURadio/SRC/gnuradio/gruel/src/swig/)
include_directories (/home/joel/GNURadio/SRC/gnuradio/gnuradio-core/src/lib/runtime/)

########################################################################
# Include swig generation macros
########################################################################
include(GrSwig)
include(GrPython)

########################################################################
# Added from UHD Makefile
########################################################################

set(GR_SWIG_FLAGS -DGR_HAVE_ASAT) #needed to parse asat_swig.i
set(GR_SWIG_TARGET_DEPS core_swig)

########################################################################
# Setup swig generation
########################################################################
set(GR_SWIG_INCLUDE_DIRS
    ${GR_ASAT_INCLUDE_DIRS}
    ${GR_UHD_INCLUDE_DIRS}
    ${GNURADIO_CORE_SWIG_INCLUDE_DIRS}
)

set(GR_SWIG_DOC_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/../include)

link_directories(${ASAT_LIBRARY_DIRS})
link_directories(${UHD_LIBRARY_DIRS})
set(GR_SWIG_LIBRARIES gnuradio-asat uhd ${ASAT_LIBRARIES})

GR_SWIG_MAKE(asat_swig asat_swig.i)

########################################################################
# Install the build swig module
########################################################################
GR_SWIG_INSTALL(
    TARGETS asat_swig 
    DESTINATION ${GR_PYTHON_DIR}/gnuradio/asat
    COMPONENT "asat_python"
)

########################################################################
# Install swig .i files for development
########################################################################
install(
    FILES asat_swig.i
    DESTINATION ${GR_INCLUDE_DIR}/gnuradio/swig
    COMPONENT "asat_swig"
)

GR_PYTHON_INSTALL(
    FILES __init__.py
    DESTINATION ${GR_PYTHON_DIR}/gnuradio/asat
    COMPONENT "asat_python"
)
