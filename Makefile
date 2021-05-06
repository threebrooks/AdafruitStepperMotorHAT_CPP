all:
	g++ -std=c++11 -c *.cpp
	ar cr libAdafruitStepperMotorHAT.a Adafruit_MotorHAT.o PWM.o
	g++ -std=c++11 -o StepperMotorTest StepperMotorTest.cpp libAdafruitStepperMotorHAT.a -lwiringPi -lpthread -lcrypt -lrt
	ar cr libAdafruitDCMotorHAT.a Adafruit_MotorHAT.o PWM.o
	g++ -std=c++11 -o DCMotorTest DCMotorTest.cpp libAdafruitDCMotorHAT.a -lwiringPi -lpthread -lcrypt -lrt

clean:
	rm -rf StepperMotorTest *.a *.o
	rm -rf StepperMotorTest
	rm -rf DCMotorTest *.a *.o
	
