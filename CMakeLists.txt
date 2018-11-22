################################################################################
# Copyright (C) 2018 <NAME HERE>
#
# All rights reserved. Published under the BSD-3 license in the LICENSE file.
################################################################################

cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(tudostats_example)

include(setup.cmake)

# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Not so nice C++17 integration, as CMake version >= 3.8 is not available here
set(CMAKE_CXX_FLAGS "-std=c++17 ${CMAKE_CXX_FLAGS}")

add_subdirectory(external/tudostats)

add_executable(example
    example.cpp
)
target_link_libraries(example
    tudocomp_stat
)

################################################################################
