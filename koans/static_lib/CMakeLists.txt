
add_library(pretty_fication STATIC src/prettify.cpp)
target_include_directories(pretty_fication INTERFACE inc)

get_target_property(INCLUDES pretty_fication INCLUDE_DIRECTORIES)
koan_assert_equal("inc" "${INCLUDES}"
  MASTER_SAYS "Include directories can be set for a specific target.")

get_target_property(INTERFACES pretty_fication INTERFACE_INCLUDE_DIRECTORIES)
koan_assert_equal("inc" "${INTERFACES}"
  MASTER_SAYS "Include directories can be specified to be shared with a target's dependees.")
