cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(example-apps)

set(Torch_DIR "${CMAKE_SOURCE_DIR}/lib/libtorch/share/cmake/Torch")

# boost
find_package( Boost REQUIRED COMPONENTS program_options regex )
include_directories( ${Boost_INCLUDE_DIRS} )

# jsoncpp
set(JSON_INC "/usr/local/include/json")
set(JSON_LIB "/usr/local/lib/libjsoncpp.dylib")
include_directories( ${JSON_INC} )

#curl
find_package(CURL REQUIRED)
include_directories( ${CURL_INCLUDE_DIRS} )


#gym
set(GYM_INC "${CMAKE_SOURCE_DIR}/external/gym-http-api/binding-cpp/include")
set(GYM_BINDING "${CMAKE_SOURCE_DIR}/external/gym-http-api/binding-cpp/gym_binding.cpp")
include_directories( ${GYM_INC} )

find_package(Torch REQUIRED)

add_executable(example-app example-app.cpp)
target_link_libraries(example-app ${TORCH_LIBRARIES})

add_executable(reinf1 reinf1.cpp ${GYM_BINDING})
target_link_libraries(reinf1 ${JSON_LIB} ${Boost_LIBRARIES} ${CURL_LIBRARIES} ${TORCH_LIBRARIES})


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
