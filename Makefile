CXX = g++
LD = g++
CXXFLAGS = -c -Wall -std=c++11
LDFLAGS = -std=c++11 -lwiringPi -lpthread -lcrypt -lrt
RM = rm -rf

all: libAdafruitStepperMotorHAT.a libAdafruitDCMotorHAT.a StepperMotorTest DCMotorTest
	

PWM.o:
	$(CXX) $(CXXFLAGS) PWM.cpp

Adafruit_MotorHAT.o:
	$(CXX) $(CXXFLAGS) Adafruit_MotorHAT.cpp

libAdafruitStepperMotorHAT.a: PWM.o Adafruit_MotorHAT.o
	ar cr libAdafruitStepperMotorHAT.a Adafruit_MotorHAT.o PWM.o

libAdafruitDCMotorHAT.a: PWM.o Adafruit_MotorHAT.o
	ar cr libAdafruitDCMotorHAT.a Adafruit_MotorHAT.o PWM.o

StepperMotorTest: libAdafruitStepperMotorHAT.a
	$(LD) $(LDFLAGS) -o StepperMotorTest StepperMotorTest.cpp libAdafruitStepperMotorHAT.a

DCMotorTest: libAdafruitDCMotorHAT.a
	$(LD) $(LDFLAGS) -o DCMotorTest DCMotorTest.cpp libAdafruitDCMotorHAT.a

clean:
	$(RM) StepperMotorTest DCMotorTest *.a *.o
