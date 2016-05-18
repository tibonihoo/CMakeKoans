# 'option' declares and document an option usable with the GUI or the command line (via -D<OPTION_NAME>=<OPTION_VALUE>
option(APPRENTICE_NAME "Name of the apprentice walking the path of enlightenment" "YOU")

koan_assert_equal("YOU" "${APPRENTICE_NAME}"
  MASTER_SAYS "Options are here to be set at CMake invocation.")

set(APPRENTICE_NAME "KOHAI" CACHE STRING "A better value for the apprentice name")
koan_assert_equal("KOHAI" "${APPRENTICE_NAME}"
  MASTER_SAYS "Options are cached but can be forced to change with a little effort.")

configure_file(
  "summarize_koans.cpp.in"
  "summarize_koans.cpp"
  )

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/summarize_koans.cpp")
  set(CPP_SOURCE_FOUND_HERE TRUE)
else()
  set(CPP_SOURCE_FOUND_HERE FALSE)
endif()  
koan_assert_equal("<FILL WITH CORRECT VALUE>" "${CPP_SOURCE_FOUND_HERE}"
  MASTER_SAYS "Generated files don't pollute the source directory.")

if(EXISTS ${CMAKE_CURRENT_BINARY_DIR}/summarize_koans.cpp)
  set(CPP_SOURCE_FOUND_IN_OUTPUT TRUE)
else()
  set(CPP_SOURCE_FOUND_IN_OUTPUT FALSE)
endif()  
koan_assert_equal("<FILL WITH CORRECT VALUE>" "${CPP_SOURCE_FOUND_IN_OUTPUT}"
  MASTER_SAYS "Generated files are produced at configuration time.")

add_executable(summarize_koans "${CMAKE_CURRENT_BINARY_DIR}/summarize_koans.cpp")
target_link_libraries(summarize_koans PUBLIC pretty_fication)

get_target_property(DEPS summarize_koans LINK_LIBRARIES)
koan_assert_equal("pretty_fication" "${DEPS}"
  MASTER_SAYS "Target can be linked to other targets.")

get_target_property(INTERFACES summarize_koans INTERFACE_LINK_LIBRARIES)
koan_assert_equal("INTERFACES-NOTFOUND" "${INTERFACES}"
  MASTER_SAYS "Dependencies may or may not be forwarded to dependees.")
