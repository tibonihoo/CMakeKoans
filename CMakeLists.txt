# Koans to learn CMake
# Sources at https://github.com/tibonihoo/CMakeKoans
# Author: Thibauld Nion
#


# CMake is available at http://cmake.org/
cmake_minimum_required(VERSION 3.3)


# Chose the generator according to the selector initially chosen for running this cmake
set(GENERATOR_OPTIONS "-G" "${CMAKE_GENERATOR}")
if(CMAKE_BUILD_TYPE)
  list(APPEND GENERATOR_OPTIONS "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}")
endif()

add_custom_target(KoanWorkingDirectory
  ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/koans_build)

add_custom_target(KoanProject
  ${CMAKE_COMMAND} ${GENERATOR_OPTIONS} -DAPPRENTICE_NAME=NEWB ${PROJECT_SOURCE_DIR}/koans
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/koans_build
  DEPENDS KoanWorkingDirectory)

add_custom_target(RunKoans ALL
  ${CMAKE_COMMAND} --build . 
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/koans_build
  DEPENDS KoanProject)
