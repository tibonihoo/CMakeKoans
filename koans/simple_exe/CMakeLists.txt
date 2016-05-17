

add_executable(simple_cat simple_cat.cpp)
target_compile_definitions(simple_cat PRIVATE HEADER_SYMBOL="!") # replace PRIVATE by INTERFACE


get_target_property(DEFINES simple_cat COMPILE_DEFINITIONS)
string(REGEX MATCH "HEADER_SYMBOL=[^;]+" HEADER_DEFINITION "${DEFINES}")
koan_assert("Compile-time definitions can be set for each target"
  "HEADER_SYMBOL=\"!\"" "${HEADER_DEFINITION}")
