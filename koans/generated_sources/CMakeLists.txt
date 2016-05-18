option(APPRENTICE_NAME "Name of the apprentice walking the path of enlightenment" "YOU")

koan_assert("Options are here to be set at CMake invocation."
  "YOU" "${APPRENTICE_NAME}")

set(APPRENTICE_NAME "KOHAI" CACHE STRING "A better value for the apprentice name" FORCE)
koan_assert("Options can be forced with a little effort."
  "KOHAI" "${APPRENTICE_NAME}")

configure_file(
  "summarize_koans.cpp.in"
  "${PROJECT_BINARY_DIR}/summarize_koans.cpp"
  )

add_executable(summarize_koans "${PROJECT_BINARY_DIR}/summarize_koans.cpp")
target_link_libraries(summarize_koans PRIVATE pretty_fication)

get_target_property(DEPS summarize_koans LINK_LIBRARIES)
koan_assert("Target can be lonked to other targets."
  "pretty_fication" "${DEPS}")

get_target_property(INTERFACES summarize_koans INTERFACE_LINK_LIBRARIES)
koan_assert("Dependencies may or may not be forwarded to dependees."
  "INTERFACES-NOTFOUND" "${INTERFACES}")

