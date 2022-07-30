cmake_minimum_required(VERSION 3.1)
project(example)

set(CMAKE_CXX_STANDARD 14)

set(LIB_SOURCES
  ${CMAKE_SOURCE_DIR}/Adafruit_MotorHAT.cpp
  ${CMAKE_SOURCE_DIR}/PWM.cpp
)

set(LIB_INCLUDES
  ${I2CDEV_HOME}/I2Cdev
  ${I2CDEV_HOME}/MPU6050
)

set(EXTERNAL_LIBS
#  /usr/local/lib/libbcm2835.a
  wiringPi
#  ${PiPCA9685_LIBRARY}
)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_FLAGS "-Wall -Wextra -pthread")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

add_library(Adafruit_MotorHAT ${LIB_SOURCES})
target_include_directories(Adafruit_MotorHAT PUBLIC ${LIB_INCLUDES})

# DCMotorTest
add_executable(DCMotorTest DCMotorTest.cpp ${LIB_SOURCES})
target_include_directories(DCMotorTest PUBLIC ${LIB_INCLUDES})
target_link_libraries(DCMotorTest ${EXTERNAL_LIBS})

#StepperMotorTest
add_executable(StepperMotorTest StepperMotorTest.cpp ${LIB_SOURCES})
target_include_directories(StepperMotorTest PUBLIC ${LIB_INCLUDES})
target_link_libraries(StepperMotorTest ${EXTERNAL_LIBS})


