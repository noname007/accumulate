#include <stdio.h>

// __func__
// 
#define _func_name() printf("%s\n",__func__);
#define _FUNC_N printf("%s\n",__func__);
void func_name(){
	_func_name()

	printf("%s\n",__func__);
}
int main(int argc, char const *argv[])
{
	_FUNC_N
	_func_name()
	// func_name();
	// printf("%s\n",__func__);
	return 0;
}