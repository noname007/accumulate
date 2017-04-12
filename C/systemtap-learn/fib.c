#include <stdio.h>

int fib(int n)
{
    if(n < 2)
    {
        return n;
    }
    return fib(n-2) + fib(n - 1 );
}

int main(int argc, char const *argv[])
{
    int n = 3;
    for (;n < 10 ; ++ n)
        printf("%d:%d\n",n,fib(n));
    return 0;
}