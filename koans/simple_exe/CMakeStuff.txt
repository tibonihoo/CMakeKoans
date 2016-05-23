
add_executable(simple_cat simple_cat.cpp)

if(TARGET simple_cat)
  set(SIMPLE_CAT_TARGET_DEFINED TRUE)
else()
  set(SIMPLE_CAT_TARGET_DEFINED FALSE)
endif()
koan_assert_equal("${SIMPLE_CAT_TARGET_DEFINED}" "TRUE"
  MASTER_SAYS "Configuring the compilation of an executable or a library is done by providing its name and its sources.")

get_target_property(SRC simple_cat SOURCES)
koan_assert_equal("simple_cat.cpp" "${SRC}"
  MASTER_SAYS "The sources should be provided as relative path whenever possible for easier maintenance of the configuration.")

# The sources needs a compile-time definition for HEADER_SYMBOL
target_compile_definitions(simple_cat PRIVATE HEADER_SYMBOL)

get_target_property(DEFINES simple_cat COMPILE_DEFINITIONS)
koan_assert_equal("HEADER_SYMBOL=\"!\"" "${DEFINES}"
  MASTER_SAYS "Correctly setting compile-time defininitions for a specific target is key to building it correctly.")
