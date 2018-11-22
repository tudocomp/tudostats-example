# Define the C++ executable
add_executable(example
    example.cpp
)

# Set the include paths that are associated with this target
target_include_directories(example PUBLIC
  $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_SOURCE_DIR}/include>
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
