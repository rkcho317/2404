#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include <cstring>

extern "C" double royal(char[]);

int main(int argc, char* argv[]){
    double noble=0.0;
    char ident[100];

    //String Blocks
    //Introduction
    std::string intro =  "Welcome to Software Analysis by Paramount Programmers, Inc. Please enter your first and last names and press enter: ";
    
    std::cin >> ident;

    std::cout<< ident <<std::endl; //what is name?

    std::string thankyou1 = "Thank you";
    std::string thankyou2 = " Our records show that you applied for employment her with our agency a week ago." ;
    std::string thankyou3 = "Please enter your expected annual salary when employed at Paramount: " ;
    std::string thankyou4 = "Your interview with Ms Linda Fenster, Personnel Manager, will begin shortly.";

    if (ident =="CS Major"){
        printf("%s\n",thankyou1,);
        //interview output
       /* Hello Joey Brown I am the receptionist.  
        This envelope contains your job offer with starting salary 50000.00.  Please check back on Monday morning at 8am.
        Bye
        */

        break;

        case 2: //Chris Sawyer
        intro;
        intro2; //ft. Chris Sawyer
        //interview output
       /* Hello Mr Sawyer.  I am the receptionist.  
        This envelope has your job offer starting at 1 million annual.  Please start any time you like.
        Bye
        */

        break;

        case 3: //social major
        intro;
        intro2;
        //interview output
       /* Hello Joey Brown I am the receptionist
        I am sorry we have no openings for you.  Please try us next month.
        Bye
        */

        break;

    }

    noble = royal(ident);

    //Floating point 88000.88 is returned to front desk whenever CS major completes interview and answers the questions about the Ohms correctly

    return 0;
}