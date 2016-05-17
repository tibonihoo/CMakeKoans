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

