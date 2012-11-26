#!/bin/sh
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/joel/GNURadio/SRC/gnuradio/gr-asat/python
export PATH=/home/joel/GNURadio/SRC/gnuradio/gr-asat/build/python:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DYLD_LIBRARY_PATH
export PYTHONPATH=/home/joel/GNURadio/SRC/gnuradio/gr-asat/build/swig:$PYTHONPATH
/usr/bin/python /home/joel/GNURadio/SRC/gnuradio/gr-asat/python/qa_asat.py 
