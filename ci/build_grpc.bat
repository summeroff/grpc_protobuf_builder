set GRPC_VERSION=v1.47.0
set CMakeGenerator=Visual Studio 17 2022

if exist build/dist/grpc_dist/ (
    exit 0
)

mkdir -p build/dist
cd build/dist

git clone  --branch %GRPC_VERSION% --depth 1 --recurse-submodules  https://github.com/grpc/grpc
cd grpc

md .build
cd .build
 
cmake ..  -G"%CMakeGenerator%"  -A x64  -DgRPC_INSTALL=ON -DCMAKE_INSTALL_PREFIX="..\..\grpc_dist" -DgRPC_BUILD_TESTS=OFF 
cmake --build . --target install --config Release
