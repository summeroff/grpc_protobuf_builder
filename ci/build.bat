set CMakeGenerator=Visual Studio 17 2022

mkdir build 
cd build 

cmake .. ^
    -G"%CMakeGenerator%" -A x64 ^
    -DProtobuf_DIR=%CD%\dist\protobuf_dist ^
    -DgRPC_DIR==%CD%\dist\grpc_dist ^
    -DCMAKE_INSTALL_PREFIX="%INSTALL_PACKAGE_PATH%"

cmake --build . --target install --parallel 2 --config %BUILD_CONFIGURATION%