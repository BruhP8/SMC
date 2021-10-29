
FLAGS=-Wno-deprecated -fpermissive -std=gnu++0x -m32
LDFLAGS=-Wno-deprecated -fpermissive -m32

FASTLIBS=-L. -L/users/outil/dsx/systemcass/lib

INCLUDE=-I. -I/users/outil/dsx/systemcass/include -I/users/outil/dsx/cctools/include

#LIBS=

CC=g++

SRC=fifo_gcd_coprocessor.cpp fifo_gcd_master.cpp tp1_top.cpp

OBJ=fifo_gcd_coprocessor.o fifo_gcd_master.o tp1_top.o


simulator.x : $(OBJ)
	$(CC) $(LDFLAGS) $(FASTLIBS) -o $@ $^ -lsystemc -ldl

%.o : %.cpp
	$(CC) -c $(FLAGS) $(INCLUDE) $^

clean :
	rm *.o simulator.x


