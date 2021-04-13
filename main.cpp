#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include <cstring>

extern "C" double royal();

int main(int argc, char* argv[]){
    double noble=0.0;
    string ident;

    //String Blocks
    //Introduction
    string intro = printf("\nWelcome to Software Analysis by Paramount Programmers, Inc."
                           "\nPlease enter your first and last names and press enter: ");
    string intro2 = printf("\nThank you Joey Brown.  Our records show that you applied for employment her with our agency a week ago."
                            "\nPlease enter your expected annual salary when employed at Paramount: 500500.50"
                            "\nYour interview with Ms Linda Fenster, Personnel Manager, will begin shortly.");

    //switch case
    switch (ident){
        case 1: //CS Major
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
        intro2; /ft. Chris Sawyer
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

    noble = royal();



    return 0;
}