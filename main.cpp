#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include <cstring>

extern "C" double royal();

int main(int argc, char* argv[]){
    
    char ident[100];
    double sal;
    
    double noble=0.0;
    noble = royal();

    //String Blocks
    //Introduction
    std::cout<<"Welcome to Software Analysis by Paramount Programmers, Inc. Please enter your first and last names and press enter: "<<std::endl;
    std::cin >> ident;
    std::cout<< ident <<std::endl; 

    std::cout<< "Thank you "<<std::endl;

    std::cout<< " Our records show that you applied for employment her with our agency a week ago." <<std::endl;

    std::cout<<"Please enter your expected annual salary when employed at Paramount: " <<std::endl;
    std::cin>> sal;
    std::cout<<sal<<std::endl;

    std::cout<< "Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly."<<std::endl;

    //BEGIN INTERVIEW.ASM 

    if (noble ==88000.88){
       
        //interview output
        //Floating point 88000.88 is returned to front desk whenever CS major completes interview and answers the questions about the Ohms correctly
  
        std::cout<<"Hello " << ident << " .I am the receptionist"<<std::endl;
        std::cout<<"This envelope contains your job offer with starting salary 88000.88.\nPlease check back on Monday morning at 8am.\nBye"<<std::endl;
      }

      else if ( noble == 1000000.00){
          //interview output
          //If Chris applies for a job then Ms Fenster sends the code number 1 000 000.00 to the front desk.

          std::cout<<"Hello Mr. Sawyer .I am the receptionist. \nThis envelope has your job offer starting at 1 million annual.\nPlease start any time you like."<<std::endl;
          std::cout<<"In the middle time our CTO wishes to have dinner with you.\nHave a very nice evening, Mr. Sawyer"<<std::endl; 

      } 

        else if (noble == 1200.12) {

        //interview output
        //If the philosophy major applies for the job then Ms Fenster sends 1200.12 to the front desk in a private envelope.
        std::cout<<"Hello " << ident << " .I am the receptionist"<<std::endl;
        std::cout<<"We have an opening for you in the company cafeteria for $1200.12 annually.\nTake your time to let us know your decision.\nBye"<<std::endl;

        } 
        
      else{
        return 0;
      }
  

    
}