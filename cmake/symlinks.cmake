# Add MariaDB symlinks
MACRO(CREATE_MARIADB_SYMLINK binaryname symlinkname)
  IF (EXISTS ${CMAKE_CURRENT_BINARY_DIR}/${binaryname} AND NOT WIN32)
    install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink ${binaryname} ${CMAKE_CURRENT_BINARY_DIR}/${symlinkname})" COMPONENT symlinks)
    install(CODE "message(\"-- Created symlink: ${symlinkname} -> ${binaryname}\")" COMPONENT symlinks)
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${symlinkname} DESTINATION ${INSTALL_BINDIR} COMPONENT symlinks)
  ENDIF()
ENDMACRO(CREATE_MARIADB_SYMLINK)
