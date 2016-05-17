# CMake is available at http://cmake.org/
cmake_minimum_required(VERSION 3.3)

# Utilities
set_property(GLOBAL PROPERTY KOANS_TOTAL 0)
set_property(GLOBAL PROPERTY KOANS_DONE  0)


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
    math(EXPR DONE_SO_FAR "${DONE_SO_FAR}+1")
    set_property(GLOBAL PROPERTY KOANS_DONE ${DONE_SO_FAR})
  else()
    message(STATUS "${DONE_SO_FAR} out of ${TOTAL} koans completed.")
    message(FATAL_ERROR "Master says you should meditate on ${NAME}")
  endif()
endfunction()

## Trigger a congratulation message after a sanity check on the number of done koans.
##
## To be called once at the very end of the master CMakeLists.
function(koan_final_check)
  get_property(DONE_SO_FAR GLOBAL PROPERTY KOANS_DONE)
  get_property(TOTAL GLOBAL PROPERTY KOANS_TOTAL)
  if(DONE_SO_FAR EQUAL TOTAL)
    message(STATUS "Congratulations you've gone through all of the ${DONE_SO_FAR} koans.")
  else()
    message(STATUS "${DONE_SO_FAR} koans completed out of ${TOTAL}.")
    message(FATAL_ERROR "Master says you should meditate on the missing koans.")
  endif()
endfunction()

# TODO:
# inside koans:
# - lang
# - exe
# - lib
# - test
# - pack

koan_final_check()
