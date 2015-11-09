#!/bin/bash
#
# My shell script to build opencv with python3 bindings
#
# Original post: http://stackoverflow.com/questions/20953273/install-opencv-for-python-3-3/21212023#21212023
#
#
#
# Run it
#

if [ $# -lt 1 ]
then
	echo "Usage: $0 <install dir>"
	exit 1
fi

OPENCV_SOURCE_DIR=$1
PYTHON3_CONFIG=python3-config
BUILD_DIR="$(pwd)/build"
NUM_THREADS=8
MAIN_TAG="3.0.0"
CONTRIB_TAG="3.0.0"  # This will also download opencv_contrib and checkout the appropriate tag https://github.com/Itseez/opencv_contrib
OPENCV_REPOSITORY="https://github.com/Itseez/opencv"
OPENCV_CONTRIB_REPOSITORY="https://github.com/Itseez/opencv_contrib"


set -x  # Exit if error

# check PYTHON3_CONFIG command
which $PYTHON3_CONFIG 1>/dev/null 2>&1 || (echo "No $PYTHON3_CONFIG is found, exit!"; exit 1)

PYTHON_DIR=$($PYTHON3_CONFIG --prefix)

# Create build dir and checkout opencv code
mkdir -p $BUILD_DIR
cd ${BUILD_DIR} || (echo "lslsls"; exit 1)

echo '**Going to do: cmake'
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=$1 \
    -D PYTHON3_PACKAGES_PATH=~/.virtualenvs/cv3/lib/python3.4/site-packages \
    -D PYTHON3_LIBRARY=${PYTHON_DIR}/lib/libpython3.4m.dylib \
    -D PYTHON3_INCLUDE_DIR=${PYTHON_DIR}/include/python3.4m \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D BUILD_EXAMPLES=ON \
    -D BUILD_opencv_python3=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    ../

exit 0	# -- stop here for test

cd ${OPENCV_DIR}

if  [[ ! -d opencv_contrib ]]
then
    echo '**Get contrib modules'
    [[ -d opencv_contrib ]] || mkdir opencv_contrib
    git clone git@github.com:Itseez/opencv_contrib.git .
    git checkout ${CONTRIB_TAG}
else
    echo '**Contrib directory already exists. Not fetching.'
fi

cd ${OPENCV_DIR}

echo '**Going to do: cmake'
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D PYTHON_EXECUTABLE=${PYTHON_DIR}/bin/python3 \
    -D PYTHON_LIBRARY=${PYTHON_DIR}/lib/libpython3.4m.dylib \
    -D PYTHON_INCLUDE_DIR=${PYTHON_DIR}/include/python3.4m \
    -D PYTHON_NUMPY_INCLUDE_DIRS=${PYTHON_DIR}/lib/python3.4/site-packages/numpy/core/include/numpy \
    -D PYTHON_PACKAGES_PATH=${PYTHON_DIR}lib/python3.4/site-packages \
    -D OPENCV_EXTRA_MODULES_PATH=opencv_contrib/modules \
    -D BUILD_opencv_legacy=OFF  \
    ${OPENCV_DIR}


echo '**Going to do: make'
make -j${NUM_THREADS}

echo '**Going to do: make install'
sudo make  install

echo '**Add the following to your .bashrc: export PYTHONPATH=${PYTHONPATH}:${OPENCV_DIR}/lib'
export PYTHONPATH=${PYTHONPATH}:${OPENCV_DIR}/lib

echo '**Testing if it worked'
python3 -c 'import cv2'
echo 'opencv properly installed with python3 bindings!'  # The script will exit if the above failed.
