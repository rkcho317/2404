#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include <cstring>

extern "C" double royal(char[]);

int main(int argc, char* argv[]){
    double noble=0.0;
    char ident[100];
    double sal;

    //String Blocks
    //Introduction
    std::string intro =  "Welcome to Software Analysis by Paramount Programmers, Inc. Please enter your first and last names and press enter: ";
    std::cin >> ident;
    std::cout<< ident <<std::endl; //what is name?

    std::string thankyou1 = "Thank you ";
    std::string thankyou2 = " Our records show that you applied for employment her with our agency a week ago." ;
    std::string thankyou3 = "Please enter your expected annual salary when employed at Paramount: " ;
    std::string thankyou4 = "Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly.";

    if (ident =="CS Major"){
        printf("%s\n",thankyou1,ident); //need to add in name
        printf("%s\n",thankyou2);
        printf("%s\n",thankyou3,sal); //need to add in salary
        printf("%s\n",thankyou4);
        //interview output
  
        std::cout<<"Hello " << ident << " .I am the receptionist"<<std::endl;
        std::cout<<"\nThis envelope contains your job offer with starting salary" << sal << "Please check back on Monday morning at 8am.\nBye"<<std::endl;
      }

      else if ( ident == "Chris Sawyer"){
          //interview output
       /* Hello Mr Sawyer.  I am the receptionist.  
        This envelope has your job offer starting at 1 million annual.  Please start any time you like.
        Bye
        */

      } 

        else if (ident == "Social Major") {
        intro;
        intro2;
        //interview output
       /* Hello Joey Brown I am the receptionist
        I am sorry we have no openings for you.  Please try us next month.
        Bye
        */

        } 
        
      else{
        return 0;
      }


    noble = royal(ident);

    //Floating point 88000.88 is returned to front desk whenever CS major completes interview and answers the questions about the Ohms correctly


}