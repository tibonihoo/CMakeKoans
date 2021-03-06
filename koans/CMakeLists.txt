# CMake is available at http://cmake.org/
cmake_minimum_required(VERSION 3.3)

project(CMakeKoans VERSION 1.0)

# Set up from where we may load the custom CMake scripts used for defining koans
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/__scripts__")
include(KoanAssert)


set(TEST_VALUE "FALSE")
koan_assert_equal("${TEST_VALUE}" "TRUE" 
  MASTER_SAYS "Improving the code preceding an assertion is the right way to progress on the way to enlightenment.")

koan_assert_equal("<FILL IN CORRECT VALUE>" "AGREED" 
  MASTER_SAYS "Only when explicitely invited, should you modify the assertion's content.")

add_subdirectory(simple_exe)
if(TARGET simple_cat)
  set(SIMPLE_EXE_CONFIG_FOUND TRUE)
else()
  set(SIMPLE_EXE_CONFIG_FOUND FALSE)
endif()
koan_assert_equal("${SIMPLE_EXE_CONFIG_FOUND}" "TRUE" 
  MASTER_SAYS "CMake works best for projects with sources grouped in components each in a sub directory with a file named 'CMakeLists.txt'.\n\
  Libraries and executables for these components are then all referred to as 'targets' in CMake linguo by analogy with Makefiles 'target' concept (ie something to be done or built).")

add_subdirectory(var_scopes)

add_subdirectory(static_lib)

add_subdirectory(generated_sources)

add_subdirectory(custom_target)

