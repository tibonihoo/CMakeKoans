
add_executable(simple_cat simple_cat.cpp)
target_compile_definitions(simple_cat INTERFACE HEADER_SYMBOL="!")

get_target_property(DEFINES simple_cat COMPILE_DEFINITIONS)
koan_assert("Setting the right compile-time defininitions for a specific target is key to building it correctly."
  "HEADER_SYMBOL=\"!\"" "${DEFINES}")
