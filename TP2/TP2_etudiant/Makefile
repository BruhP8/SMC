
FLAGS=-Wno-deprecated -fpermissive -std=gnu++0x -m32 -g
LDFLAGS=-Wno-deprecated -fpermissive -m32

FASTLIBS=-L. -L/users/outil/dsx/systemcass/lib

INCLUDE=-I. -I/users/outil/dsx/systemcass/include -I/users/outil/dsx/cctools/include

#LIBS=

CC=g++

SRC=vci_gcd_coprocessor.cpp vci_gcd_master.cpp tp2_parallel_top.cpp address_decoding_table.cpp address_masking_table.cpp mapping_table.cpp segment.cpp vci_vgsb.cpp

OBJ=vci_gcd_coprocessor.o vci_gcd_master.o tp2_parallel_top.o address_decoding_table.o address_masking_table.o mapping_table.o segment.o vci_vgsb.o


multi_simulator.x : $(OBJ)
	$(CC) $(LDFLAGS) $(FASTLIBS) -o $@ $^ -lsystemc -ldl

%.o : %.cpp
	$(CC) -c $(FLAGS) $(INCLUDE) $^

clean :
	rm *.o multi_simulator.x


