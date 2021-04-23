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
    std::string intro = printf("\nWelcome to Software Analysis by Paramount Programmers, Inc.\nPlease enter your first and last names and press enter: ");
    
    std::cin >> ident;
    double corax;

    std::cout<< corax <<std::endl; //what is name?

    std::string intro2 = printf("\nThank you Joey Brown.  Our records show that you applied for employment her with our agency a week ago. \nPlease enter your expected annual salary when employed at Paramount: %int. \nYour interview with Ms Linda Fenster, Personnel Manager, will begin shortly.");

    //switch case
    switch (corax){
        case "CS Major": //CS Major
        intro;
        intro2;
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