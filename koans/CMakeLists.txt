# CMake is available at http://cmake.org/
cmake_minimum_required(VERSION 3.3)


## Trigger a fatal error is TESTED is different from the EXPECTED value.
## Otherwise increment the number of done koans.
##
## Usage:
##   koan_assert("Do or do not there is no try" expected_value tested_value)
##
function(koan_assert NAME EXPECTED TESTED)
  get_property(DONE_SO_FAR GLOBAL PROPERTY KOANS_DONE)
  get_property(TOTAL GLOBAL PROPERTY KOANS_TOTAL)
  if("${EXPECTED}" STREQUAL "${TESTED}")
    list(APPEND DONE_SO_FAR "${NAME}")
    set_property(GLOBAL PROPERTY KOANS_DONE ${DONE_SO_FAR})
  else()
    message(STATUS "${DONE_SO_FAR} out of ${TOTAL} koans completed.")
    message(STATUS "But ${EXPECTED} != ${TESTED}")
    message(FATAL_ERROR "Master says you should meditate on ${NAME}")
  endif()
endfunction()


project(CMakeKoans VERSION 0.1)

# Utilities
set_property(GLOBAL PROPERTY KOANS_TOTAL 0)
set_property(GLOBAL PROPERTY KOANS_DONE  "")


add_subdirectory(simple_exe)

add_subdirectory(var_scopes)

add_subdirectory(static_lib)

add_subdirectory(generated_sources)

add_subdirectory(custom_target)

# TODO: scripts/"includes" and option
