################################################################################
# Copyright (C) 2018 Marvin Löbel <loebel.marvin@gmail.com>
#
# All rights reserved. Published under the Apache license in the LICENSE file.
################################################################################

# Set up usefull cmake settings.

# Prevent in-source builds, as they can break in
# interesting ways and are hard to clean up.
if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "In-source builds are not allowed. "
    "Please remove ${CMAKE_BINARY_DIR}/CMakeCache.txt and the ${CMAKE_BINARY_DIR}/CMakeFiles/ directory. "
    "Then create a sub-directory and call `cmake ..`")
endif()

# Try to enable compilation caching to speed up repeated builds. Requires
# ccache to be installed in the system.
find_program(CCACHE_FOUND ccache)
if(CCACHE_FOUND)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif(CCACHE_FOUND)

# Default build configuration to a "Debug" build.
# The configuration affects things like compiler optimizations
# and debugging symbols in the binary.
#
# Possible options:
# - "Release": Fast, but without debugging support and assertions.
# - "Debug": Slow, but with debugging support and assertions.
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Debug")
endif(NOT CMAKE_BUILD_TYPE)

# CMake option to turn warnings into errors. Useful to force oneself
# to be warning-free, or for a CI tool to check it.
option(TDC_WERROR "Turn GCC warnings into errors")

# Flags that are generally recommended.
set(TDC_FLAGS "-Wall;-pedantic;-Wpedantic;-Wextra;-Werror=return-type;-fdiagnostics-color=auto")
if (TDC_WERROR)
    set(TDC_FLAGS "${TDC_FLAGS};-Werror;-pedantic-errors")
endif()

# Flags recommended for debugging.
set(TDC_DEBUG_FLAGS "-O0;-g;-ggdb;-DDEBUG")

# Flags recommended for optimized, fast, release builds.
set(TDC_RELEASE_FLAGS "-O3;-march=native;-DNDEBUG;-g")

# Output what build type we are currently using
message(STATUS "[Built Type]: " ${CMAKE_BUILD_TYPE})
