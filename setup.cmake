if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "In-source builds are not allowed. "
    "Please remove ${CMAKE_BINARY_DIR}/CMakeCache.txt and the ${CMAKE_BINARY_DIR}/CMakeFiles/ directory. "
    "Then create a sub-directory and call `cmake ..`")
endif()

# Compile all code with ccache, if it exists in the system
find_program(CCACHE_FOUND ccache)
if(CCACHE_FOUND)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif(CCACHE_FOUND)

# Default build configuration to a "Release" build.
# The configuration affects things like compiler optimizations
# and debugging symbols in the binary.
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Debug")
endif(NOT CMAKE_BUILD_TYPE)


option(TDC_WERROR "Turn GCC warnings into errors")

set(TDC_BENCH_FLAGS "-Wall;-pedantic;-Wpedantic;-Wextra;-Werror=return-type;-fdiagnostics-color=auto")
if (TDC_WERROR)
    set(TDC_BENCH_FLAGS "${TDC_BENCH_FLAGS};-Werror;-pedantic-errors")
endif()
set(TDC_BENCH_DEBUG_FLAGS "-O0;-g;-ggdb;-DDEBUG")
set(TDC_BENCH_RELEASE_FLAGS "-O3;-march=native;-DNDEBUG;-g")
