set PROTOBUF_DIST=%CD%\build\protobuf_dist
set PROTOBUF_VERSION=v21.1
set CMakeGenerator=Visual Studio 17 2022
set WORK_DIR=%CD%

if exist "%PROTOBUF_DIST%\" (
    echo "Protobuf already installed"
) else (
    mkdir build\deps_src
    cd build\deps_src

    git clone --branch "%PROTOBUF_VERSION%" --depth 1 --recurse-submodules "https://github.com/protocolbuffers/protobuf.git"
    cd protobuf

    mkdir build
    cd build
    mkdir "%PROTOBUF_DIST%"

    cmake .. -G"%CMakeGenerator%" -A x64 -DCMAKE_INSTALL_PREFIX="%PROTOBUF_DIST%" -Dprotobuf_BUILD_TESTS=OFF


    cmake --build . --target install -j 8 --config Release
)

cd "%WORK_DIR%"
