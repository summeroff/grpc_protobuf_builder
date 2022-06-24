set GRPC_DIST=%CD%\build\grpc_dist\
set GRPC_VERSION=v1.47.0
set CMakeGenerator=Visual Studio 16 2019
set WORK_DIR=%CD%

if exist "%GRPC_DIST%" (
    echo "gRPC already installed"
) else (
    mkdir build\deps_src
    cd build\deps_src

    git clone --branch "%GRPC_VERSION%" --depth 1 --recurse-submodules "https://github.com/grpc/grpc"

    cd grpc

    mkdir build_grpc
    cd build_grpc
    
    cmake .. -G"%CMakeGenerator%"  -A x64  -DgRPC_INSTALL=ON -DCMAKE_INSTALL_PREFIX="%GRPC_DIST%" -DgRPC_BUILD_TESTS=OFF 

    mkdir "%GRPC_DIST%" 
    cmake --build . --target install --parallel 8 --config Release

)
cd "%WORK_DIR%"
