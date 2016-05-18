# CMake is available at http://cmake.org/
cmake_minimum_required(VERSION 3.3)

project(CMakeKoans VERSION 0.1)

# Set up from where we may load the custom CMake scripts used for defining koans
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/__scripts__")
include(KoanAssert)

add_subdirectory(simple_exe)

add_subdirectory(var_scopes)

add_subdirectory(static_lib)

add_subdirectory(generated_sources)

add_subdirectory(custom_target)

