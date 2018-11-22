################################################################################
# Copyright (C) 2018 Marvin Löbel <loebel.marvin@gmail.com>
#
# All rights reserved. Published under the Apache license in the LICENSE file.
################################################################################

# INFO: If there are issues because the installed cmake version is too old,
# see legacy.cmake for legacy cmake functions that can be used instead.
cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

project(tudostats_example)

# Setup useful cmake settings
include(cmake/setup.cmake)

# Compile with C++ 17 (see legacy.cmake for alternative)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the tudostats library to the build
# (might require a `git submodule update --init --recursive` first)
add_subdirectory(external/tudostats)

# Add our main source files to the build
add_subdirectory(src)
