set_property(GLOBAL PROPERTY KOANS_DONE  "")


## Trigger a fatal error is TESTED is different from the EXPECTED value.
## Otherwise increment the number of done koans.
##
## Usage:
##   koan_assert_equal(expected_value tested_value MASTER_SAYS "Do or do not there is no try")
##
function(koan_assert_equal EXPECTED TESTED MASTER_SAYS DESCRIPTION)
  get_property(DONE_SO_FAR GLOBAL PROPERTY KOANS_DONE)
  if("${EXPECTED}" STREQUAL "${TESTED}")
    list(APPEND DONE_SO_FAR "${DESCRIPTION}")
    set_property(GLOBAL PROPERTY KOANS_DONE ${DONE_SO_FAR})
  else()
    message(STATUS "${DONE_SO_FAR} koans completed.")
    message(FATAL_ERROR 
    "\
    *****************************************************************************\n\
    *****************************************************************************\n\
    *****************************************************************************\n\n\
    Master says you should meditate on:\n\n\
    ${DESCRIPTION}\n\n\
    *****************************************************************************\n\
    *****************************************************************************\n\
    *****************************************************************************")
  endif()
endfunction()
