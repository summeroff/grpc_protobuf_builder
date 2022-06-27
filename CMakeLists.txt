cmake_minimum_required(VERSION 3.20)

project(grpc_test)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Protobuf CONFIG REQUIRED)

find_package(absl CONFIG REQUIRED)

find_package(gRPC CONFIG REQUIRED)

add_executable(grpc_test main.cpp)