#include <stdio.h>

extern double manager();

int main(int argc, char* argv[]) 
{

	printf("Welcome to Arrays of Integers\n");
	printf("Bought to you by Sola Lhim\n");

    double number= manager();
	printf("Main received %6f., and will keep it for future use.\n",number);
	printf("Main will return 0 to the operating system. Bye.\n");

	return 0;
}

