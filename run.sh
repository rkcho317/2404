#!/bin/bash

#Author: Rosa Cho
#Program name: King of Assembly

rm *.o, *.lis, *.out
echo " " #Blank line

echo "Assemble the X86 file interview.asm"
nasm -f elf64 -l interview.lis -o interview.o interview.asm

echo "Compile the C++ file main.cpp"
g++ -c -m64 -Wall -std=c++14 -o main.o -fno-pie -no-pie main.cpp

echo "Link the 'O' files main.o and interview.o"
g++ -m64 -std=c++14 -fno-pie -no-pie -g -o interview.out main.o interview.o

echo "Run the program King of Assembly"
./interview.out

echo "This Bash script file will now terminate.  Bye."
