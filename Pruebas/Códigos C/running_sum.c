/* Compute a better average */

#include <stdio.h>

int main(void)
{
	int i;
	double x;
	double avg = 0.0; // a better average 
	double navg;	  // a naive average 
	double sum = 0.0;

	printf("%2s%12s%17s%19s\n%2s%13s%17s%17s\n\n", 
	" Count ", " Item ", "   Average", "    Naive avg", 
	"-------", "-------", "-------", "-------");

	for (i = 1; scanf("%lf", &x) == 1; ++i){
		avg += (x - avg)/i; 
		sum += x;
		navg = sum/i;
		printf("%5d%17e%17e%17e\n", i, x, avg, navg);
	}
	return 0;
}

/* avg = (sum - x)/i;  
avg = avg + (x - avg)/i 
avg = [(sum - x)/i] + (x - [(sum - x)/i])/i
avg = [(sum - x)/i] + (x - [(sum - x)/i])/i
avg_1 = avg_0 + (x - avg_0)/i
x - avg_0	desviación del promedio

This algorithm
Firstly calculate the desviation of the average
Este algoritmo
0 = 0
avg = 0 + (n - 0)/1
avg = 0 + (n_0 - 0)/1
avg = n_0
avg = n_0/1 + (n_1 - n_0)/2
avg = n_0 + (n_1 - n_0)/2 
avg = (2n_0 + n_1 - n_0)/2 
avg = (n_0 + n_1)/2  -------------------

avg = (n_0 + n_1)/2 + (n_2 - (n_0 + n_1)/2)/3
avg = (3[(n_0 + n_1)/2] - n_2 - (n_0 + n_1)/2)/3

avg = (n_0 + n_1 + n_2)/3 + (n_3 - (n_0 + n_1 + n_2)/3)/4
avg = (4(n_0 + n_1 + n_2)/3 + n_3 - (n_0 + n_1 + n_2)/3)/4


avg = [(n_0 + n_1 + n_2)/i - 1] + (n_3 - (n_0 + n_1 + n_2)/i - 1)/i
avg = [(sum)/i - 1] + (n_3 - (sum)/i - 1)/i
avg = (i(n ...)/i - 1) + n_3 - (n ... )/i - 1)/i
avg = (i(n ...)/i - 1) + n_3 - (n ... )/i - 1)/i


Other form of view the average
(n_0 - x/1) + (n_1 - x/2) + (n_2 - x/3) + (n_3 - x/4) = (n_0 + n_1 + n_2 + n_3)/4



avg = sum/i-1 + [x - (sum/i - 1)]/i

avg = [(i(sum)/i - 1) + x - (sum/i - 1)]/i

avg = [(i(sum)/i - 1) - (sum/i - 1) + x]/i
avg = [(i(sum) - sum /i - 1) + x]/i
avg = [(sum(i - 1)/i - 1) + x]/i
avg = (sum + x)/i 

x - avg  (desviation of the average)


15. Esto sucede porque 

*/