
add_library(pretty_fication STATIC src/prettify.cpp)
target_include_directories(pretty_fication INTERFACE inc)

get_target_property(INCLUDES pretty_fication INCLUDE_DIRECTORIES)
string(REGEX MATCH "inc" INCLUDES_MATCH "${INCLUDES}")
koan_assert("Include directories can be set for a specific target."
  "inc" "${INCLUDES_MATCH}")

get_target_property(INTERFACES pretty_fication INTERFACE_INCLUDE_DIRECTORIES)
string(REGEX MATCH "inc" INTERFACES_MATCH "${INTERFACES}")
koan_assert("Include directories can be specified to be shared with a target's dependees"
  "inc" "${INTERFACES_MATCH}")
