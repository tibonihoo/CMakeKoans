
set(MY_FLAG ON)


add_subdirectory(nested)
koan_assert("Variables set from sub-directories are not accessible by parents and siblings"
  "" "${VAR_IN_NESTED}")


function(change_flag_func)
  if(MY_FLAG)
    set(MY_FLAG OFF PARENT_SCOPE) # remove parent scope
  else()
    set(MY_FLAG ON PARENT_SCOPE)
  endif()
endfunction()

macro(change_flag_mac)
  if(MY_FLAG)
    set(MY_FLAG OFF) # set to parent scope
  else()
    set(MY_FLAG ON)
  endif()
endmacro()

change_flag_func()
koan_assert("Variables stay in their function's scope unless exported to parent scope."
  "OFF" "${MY_FLAG}")

change_flag_mac()
koan_assert("Changing a var in parent scope leaves current scope untouched."
  "ON" "${MY_FLAG}")



