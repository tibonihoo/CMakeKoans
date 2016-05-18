set_property(GLOBAL PROPERTY KOANS_DONE  "")


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
    message(STATUS "${DONE_SO_FAR} koans completed.")
    message(FATAL_ERROR 
    "\
    *****************************************************************************\n\
    *****************************************************************************\n\
    *****************************************************************************\n\n\
    Master says you should meditate on:\n\n\
    ${NAME}\n\n\
    *****************************************************************************\n\
    *****************************************************************************\n\
    *****************************************************************************")
  endif()
endfunction()
