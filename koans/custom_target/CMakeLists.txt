get_property(DONE_SO_FAR GLOBAL PROPERTY KOANS_DONE)
list(LENGTH DONE_SO_FAR NUM_DONE_SO_FAR) # TODO: put quotes and escape around list

add_custom_target(WrapUpKoans ALL
  $<TARGET_FILE:summarize_koans> ${NUM_DONE_SO_FAR} ${PROJECT_BINARY_DIR}/out.txt
  COMMAND $<TARGET_FILE:simple_cat> ${PROJECT_BINARY_DIR}/out.txt)

