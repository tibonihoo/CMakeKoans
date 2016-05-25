
set(MY_FLAG ON)

add_subdirectory(nested)

if(DEFINED VAR_IN_NESTED)
  set(NESTED_VAR_LEAKED TRUE)
else()
  set(NESTED_VAR_LEAKED FALSE)
endif()  
koan_assert_equal("FALSE" "${NESTED_VAR_LEAKED}"
  MASTER_SAYS "Variables set from sub-directories are not accessible by parents and siblings unless explicitely asked to")



function(change_flag_func)
  if(MY_FLAG)
    set(MY_FLAG OFF)
  else()
    set(MY_FLAG ON)
  endif()
endfunction()

macro(change_flag_mac)
  if(MY_FLAG)
    set(MY_FLAG OFF PARENT_SCOPE)
  else()
    set(MY_FLAG ON PARENT_SCOPE)
  endif()
endmacro()

change_flag_func()
koan_assert_equal("OFF" "${MY_FLAG}"
  MASTER_SAYS "Variables stay in their function's scope unless exported to parent scope.")

change_flag_mac()
koan_assert_equal("ON" "${MY_FLAG}"
  MASTER_SAYS "Changing a var in parent scope leaves current scope untouched.")



