#include <stdio.h>
// #define a 
#define swap(a,b) \
	a ^= b;  \
	b ^= a;  \
	a ^= b

int main(int argc, char const *argv[])
{
	int a = 1,b =2;
	swap(a,b);
	printf("%d,%d\n",a,b);
	return 0;
}
