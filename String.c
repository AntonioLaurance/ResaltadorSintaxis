/* Uso de apuntadores para hacer un String 
*/
#include <stdio.h>

int main(void){
	char *str, c;
	int i = 0;
	printf("Give me a string: ");
	
	// Read the line 
	while((c = getchar()) != '\n'){
		str[i] = c;
		i++;
	}
	
	str[i] = '\0'; // Null terminator 
	printf("Your string is: %s\n\n", str);

	return 0;
}
