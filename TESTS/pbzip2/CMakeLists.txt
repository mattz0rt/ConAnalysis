configure_file(autotest.sh autotest.sh COPYONLY)
configure_file(race_report.txt race_report.txt COPYONLY)
configure_file(danMemFuncLists.txt danMemFuncLists.txt COPYONLY)
configure_file(danPrivilegedFuncLists.txt danPrivilegedFuncLists.txt COPYONLY)
configure_file(pbzip2.bc pbzip2.bc COPYONLY)

set(SOURCE_NAME pbzip2)
set(src_bc_compiler clang)

add_custom_command(
  OUTPUT  ${SOURCE_NAME}.bc 
  #COMMAND cd ${CMAKE_CURRENT_SOURCE_DIR} && make
  COMMENT "Building LLVM bitcode ${SOURCE_NAME}.bc"
  VERBATIM
)

set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES ${SOURCE_NAME}.bc)

add_custom_target(
  pbzip2 ALL
  DEPENDS ${SOURCE_NAME}.bc)
