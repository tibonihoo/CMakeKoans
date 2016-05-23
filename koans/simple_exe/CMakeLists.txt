
add_executable(simple_cat)

if(TARGET simple_cat)
  set(SIMPLE_CAT_TARGET_DEFINED TRUE)
else()
  set(SIMPLE_CAT_TARGET_DEFINED FALSE)
endif()
koan_assert_equal("${SIMPLE_CAT_TARGET_DEFINED}" "TRUE"
  MASTER_SAYS "Configuring the compilation of an executable or a library is done by providing its name and its sources with relative paths.")

# The sources needs a compile-time definition for HEADER_SYMBOL
target_compile_definitions(simple_cat INTERFACE HEADER_SYMBOL="!")

get_target_property(DEFINES simple_cat COMPILE_DEFINITIONS)
koan_assert_equal("HEADER_SYMBOL=\"!\"" "${DEFINES}"
  MASTER_SAYS "Setting the right compile-time defininitions for a specific target is key to building it correctly.")
