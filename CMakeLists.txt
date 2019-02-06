cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(example-app)

# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/libtorch/share/cmake/Torch")

set(Torch_DIR "${CMAKE_SOURCE_DIR}/libtorch/share/cmake/Torch")

find_package(Torch REQUIRED)

add_executable(example-app example-app.cpp)
target_link_libraries(example-app "${TORCH_LIBRARIES}")
set_property(TARGET example-app PROPERTY CXX_STANDARD 11)