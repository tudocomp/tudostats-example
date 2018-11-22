################################################################################
# Copyright (C) 2018 Marvin Löbel <loebel.marvin@gmail.com>
#
# All rights reserved. Published under the Apache license in the LICENSE file.
################################################################################

# These are alternative, legacy ways to set relevant options in a cmake build
# You should only use these if your build environemtn is stuck
# on a old cmake version

# Setting the C++ standard
set(CMAKE_CXX_FLAGS "-std=c++17 ${CMAKE_CXX_FLAGS}")

# Setting compiler flags globally
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${TDC_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${TDC_RELEASE_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${TDC_DEBUG_FLAGS}")

# Add a globally visible C++ include directory
include_directories(include)
