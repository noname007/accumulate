// #include "byteorder.h"
#include <stdio.h>

// std::vector<char> v;

void type_use_byte(){
	// print
	printf("char %lld\n",sizeof(char));
	printf("short %lld\n",sizeof(short));
	printf("int %lld\n",sizeof(int));
	printf("float %lld\n",sizeof(float));
	printf("double %lld\n",sizeof(double));
	printf("long %lld\n",sizeof(long));
	printf("long long int %lld\n",sizeof(long long int));
	printf("long double %lld\n",sizeof(long double));
	printf("---------------------------------------------------------------------\n");
	// printf("%d\n",sizeof(float));
	// printf("%d\n",sizeof(float));

	// return 0;
}



void byteOrder(){
	union{
		short a;
		char chr[sizeof(short)];
	} test;

	test.a = 0x0102;
	if(test.chr[0] ==  0x02 &&test.chr[1] == 0x01){
		printf("小端序\n");
	}else if(test.chr[0] ==  0x01 &&test.chr[1] == 0x02){
		printf("大端序\n");
	}else{
		printf("未知\n");
	}

	// for(int i = 0;i<sizeof(short);++i){
	// 	printf("%x\n",test.chr[i]);
	// }
}


int main(int argc, char const *argv[])
{
	type_use_byte();
	byteOrder();
	return 0;
}