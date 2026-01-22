#!/bin/bash

# Exit immediately if any command fails
set -e  

# Define the log file location
LOGFILE="build/build.log"

# Ensure the build directory exists
mkdir -p build

# Redirect all output (stdout and stderr) to both terminal and log file
exec > >(tee "$LOGFILE") 2>&1

echo "🔧 Compiling STM32 project..."

# Navigate into the build directory
pushd build > /dev/null

# Set environment variables to use the ARM toolchain compilers
export CC=arm-none-eabi-gcc
export CXX=arm-none-eabi-g++

# Run CMake to configure the project
# The linker flag '--specs=nosys.specs' avoids linking to system-level functions not available in bare-metal
cmake -DCMAKE_EXE_LINKER_FLAGS="--specs=nosys.specs" ..

# Build the project using all available CPU cores
make -j$(nproc)

# Return to the original directory
popd > /dev/null

echo "✅ Build complete."
