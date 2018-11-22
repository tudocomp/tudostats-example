################################################################################
# Copyright (C) 2018 Marvin Löbel <loebel.marvin@gmail.com>
#
# All rights reserved. Published under the Apache license in the LICENSE file.
################################################################################

cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(tudostats_example)

include(setup.cmake)

# Compile with C++ 17 (see legacy.cmake for alternative)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the tudostats library to the build
# (might require a `git submodule update --init --recursive` first)
add_subdirectory(external/tudostats)

# Define the C++ executable
add_executable(example
    example.cpp
)

# Set the include paths that are associated with this target
target_include_directories(example PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

# Link against tudostats library (and use its include paths)
target_link_libraries(example
    tudocomp_stat
)

# Set compilation flags for this target (see legacy.cmake for alternative)
# The `TDC_*FLAGS` are set in `setup.cmake` and enable useful warnings
# performance options.
target_compile_options(example PUBLIC
  ${TDC_FLAGS}
  $<$<CONFIG:Debug>:${TDC_DEBUG_FLAGS}>
  $<$<CONFIG:Release>:${TDC_RELEASE_FLAGS}>
)

################################################################################
