echo on 
set CMakeGenerator=Visual Studio 16 2019
set MAIN_DIR=%CD%

echo call ci\win-install-protobuf.cmd
call ci\win-install-grpc.cmd

echo %CD%
cd "%MAIN_DIR%"

mkdir build 
cd build 

cmake .. ^
    -G"%CMakeGenerator%" -A x64 ^
    -DProtobuf_DIR="%GRPC_DIST%\cmake" ^
    -DgRPC_DIR="%GRPC_DIST%\lib\cmake\grpc" ^
    -Dabsl_DIR="%GRPC_DIST%\lib\cmake\absl" ^
    -DCMAKE_INSTALL_PREFIX="%INSTALL_PACKAGE_PATH%"

cmake --build . --target install --parallel 2 --config %BUILD_CONFIGURATION%