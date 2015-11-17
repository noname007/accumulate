// #include "stdio.h"
// int prime[590000001];
// int main(int argc, char const *argv[])
// {
// 	/* code */
// 	return 0;
// }
// 
#include<stdio.h>
#include<time.h>  
#include<math.h>
inline char ifprime(unsigned long n)
{
  int i;
  if(n==2)return 1;
  for(i=2;i*i<(n)+1;i++)
  {
    if(n%i==0)return 0;
  }
  return 1;
   
}
int main()
{
  clock_t start, finish;  
  double  duration;  
  unsigned long ssum=0,i,number=1,count=0;
  long nn=100000;
  start = clock();  
  while(count<nn)
  {
    number++;
    if(ifprime(number))
    {
      count++;
      ssum+=number;
    }
  }
  printf("%ld\n",ssum);
  finish = clock(); 
  duration = (double)(finish - start) / CLOCKS_PER_SEC;  
  printf( "%f seconds\n", duration );   
}