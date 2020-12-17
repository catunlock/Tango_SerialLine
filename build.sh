#!/bin/bash
INCLUDE_DIRS="-I. -I$CONDA_PREFIX/include -I$CONDA_PREFIX/include/tango"
LIBRARY_DIRS="-L$CONDA_PREFIX/lib/"
LIBRARIES="-lomniORB4 -lomnithread -lzmq -ltango -lomniDynamic4 -lCOS4 -lomniORB4 -lomnithread -llog4tango -lzmq -ldl -lpthread -lstdc++"
STANDARD="-std=c++11"

g++ -c Serial.cpp -o Serial.o $INCLUDE_DIRS $LIBRARY_DIRS $LIBRARIES 
g++ -c SerialClass.cpp -o SerialClass.o $INCLUDE_DIRS $LIBRARY_DIRS $LIBRARIES $STANDARD
# g++ -c SerialLinux.cpp -o SerialLinux.o $INCLUDE_DIRS $LIBRARY_DIRS $LIBRARIES $STANDARD
g++ -c SerialStateMachine.cpp -o SerialStateMachine.o $INCLUDE_DIRS $LIBRARY_DIRS $LIBRARIES $STANDARD

g++ Serial.o SerialClass.o SerialStateMachine.o main.cpp -o SerialServer $INCLUDE_DIRS $LIBRARY_DIRS $LIBRARIES $STANDARD
