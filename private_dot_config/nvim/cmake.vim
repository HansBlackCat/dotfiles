"-------------------------------------------------------------------------------
" CMake

" g:cmake_install_prefix same as -DCMAKE_INSTALL_PREFIX

" g:cmake_build_type same as -DCMAKE_BUILD_TYPE
" let g:cmake_build_type=Debug

" g:cmake_cxx_compiler same as -DCMAKE_CXX_COMPILER. Changes will have no effect until you run :CMakeClean and then :CMake.

" g:cmake_c_compiler same as -DCMAKE_C_COMPILER. Changes will have no effect until you run :CMakeClean and then :CMake.

" g:cmake_build_shared_libs same as -DBUILD_SHARED_LIBS

" g:cmake_toolchain_file same as -DCMAKE_TOOLCHAIN_FILE

" g:cmake_project_generator same as -G. Changes will have no effect until you run :CMakeClean and then :CMake.

" g:cmake_export_compile_commands same as -DCMAKE_EXPORT_COMPILE_COMMANDS.
let g:cmake_export_compile_commands="TRUE"

" g:cmake_ycm_symlinks create symlinks to the generated compilation database for use with YouCompleteMe.

" b:build_dir is the path to the cmake build directory for the current buffer. This variable is set with the first :CMake or :CMakeFindBuildDir call. Once found, it will not be searched for again unless you call :CMakeFindBuildDir. If automatic finding is not sufficient you can set this variable manually to the build dir of your choice.

