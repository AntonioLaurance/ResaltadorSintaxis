/* Enumerated Types
*  Saturday, 23 October 2021
*/

#include <stdio.h>

enum day{sun, mon, tue, wed, thu, fri, sat};  //declare type
typedef enum day day; try  

void print_day(day d)
{
	switch(d){
		case sun: printf("Sunday"); break;
		case mon: printf("Monday"); break;
		case tue: printf("Tuesday"); break;
		case wed: printf("Wednesday"); break;
		case thu: printf("Thursday"); break;
		case fri: printf("Friday"); break;
		case sat: printf("Saturday"); break;
		default: printf("%d is an error", d);
	}
}

day last_day(day d)
{
	return (d - 1 % 7);
}

day next_day(day d)
{
	return (d + 1 % 7);
}

int main()
{
	day today = fri;
	print_day(today);
	printf("\n\n");
	print_day(7);
	printf("\n\n");
	print_day(next_day(today));
	printf("\n\n");

	return 0;
}
