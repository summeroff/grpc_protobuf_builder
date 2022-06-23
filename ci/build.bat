set CMakeGenerator="Visual Studio 16 2019"

mkdir build 
cd build 

cmake .. ^
    -G"%CMakeGenerator%" -A x64 ^
    -DProtobuf_DIR=%CD%\build\dist\protobuf_dist ^
    -DgRPC_DIR==%CD%\build\dist\grpc_dist
    -DCMAKE_INSTALL_PREFIX="%INSTALL_PACKAGE_PATH%"

cmake --build . --target install --config %BUILD_CONFIGURATION%