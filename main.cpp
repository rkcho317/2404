/* ****************************************************************************************************************************
Program name: "King of Assembly".  This program demonstrates how to pass user inputs to generate different messages                        *
to an X86 function, and into a C++ main function.   Copyright (C) 2021 Rosa Cho                                                                             *
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
version 3 as published by the Free Software Foundation.                                                                    *
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
****************************************************************************************************************************



========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

Author information
  Author name: Rosa Cho
  Author email: rkcho317@fullerton.edu

Program information
  Program name: King of Assembly 
  Programming languages: Main function in C++; string (with embedded white space), char input/output functions in X86-64
  Date program initiated: 2021-Apr-12
  Date last updated: 2021-May-16
  Files in the program: main.cpp, interview.asm, run.sh

Purpose
The intent of this program is to show some of the basic tools or techniques for working with user inputs of strings (with embedded white space) and chars then output the results to a txt file.

This file
  File name: main.cpp
  Language: C++
  Max page width: 96 columns
  Optimal print specification: 7 point font, monospace, 132 columns, 8½x11 paper
  Compile: g++ -c -m64 -Wall -std=c++14 -o main.o -fno-pie -no-pie main.cpp
  Link: g++ -m64 -std=c++14 -fno-pie -no-pie -g -o interview.out main.o interview.o

  Execution: ./interview.out
========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
*/

#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include <string>

extern "C" double royal(char ident[100],double sal);

int main(int argc, char* argv[]){

    //double noble=0.0;
    char ident[100];
    double sal;  

    //Introduction block
    printf("%s\n", "Welcome to Software Analysis by Paramount Programmers, Inc. Please enter your first and last names and press enter: ");
    std::cin.getline(ident,100);

    std::cout<< "Thank you "<<ident<< "\nOur records show that you applied for employment her with our agency a week ago." <<std::endl;

    printf("%s\n", "Please enter your expected annual salary when employed at Paramount: ");
    std::cin>>sal;

    printf("%s\n", "Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly.");

    //Send the values of ident (name) and sal (salary) to interview.asm
    royal(ident,sal);

    /*

    //BEGIN INTERVIEW.ASM 
    noble = royal();

    if (noble ==88000.88){  //Floating point 88000.88 is returned to front desk whenever CS major completes interview and answers the questions about the Ohms correctly
  
        std::cout<<"Hello " << ident << " .I am the receptionist"<<std::endl;
        std::cout<<"This envelope contains your job offer with starting salary 88000.88.\nPlease check back on Monday morning at 8am.\nBye"<<std::endl;
      }

      else if ( noble == 1000000.00){ //If Chris applies for a job then Ms Fenster sends the code number 1 000 000.00 to the front desk.

          std::cout<<"Hello Mr. Sawyer .I am the receptionist. \nThis envelope has your job offer starting at 1 million annual.\nPlease start any time you like."<<std::endl;
          std::cout<<"In the middle time our CTO wishes to have dinner with you.\nHave a very nice evening, Mr. Sawyer"<<std::endl; 

      } 

        else if (noble == 1200.12) { //If the philosophy major applies for the job then Ms Fenster sends 1200.12 to the front desk in a private envelope.

        std::cout<<"Hello " << ident << " .I am the receptionist"<<std::endl;
        std::cout<<"We have an opening for you in the company cafeteria for $1200.12 annually.\nTake your time to let us know your decision.\nBye"<<std::endl;

        } 
        
      else{
        return 0;
      }
  
*/

return 0;
    
}