/*
 * main.c
 *
 *  Created on: 2015年9月1日
 *      Author: yz
 */

#include <stdio.h>

typedef char * byte_pointer;
//#define _BIG_ENGDIAN //大端序 ，机器为小端序故注释
void
show_byte(byte_pointer data,int len){
	int i = 0;
	printf("len:%d\n",len);

#ifdef _BIG_ENGDIAN
	for (i = 0; i < len;++i){
#else
	for (i = len -1; ~i; --i){
#endif

		printf(" %.2x ",data[i]);
	}
	printf("\n");
}

#define show_bytes_int_type(data)					show_byte((byte_pointer)(&(data)),sizeof(int));
#define show_bytes_float_type(data)					show_byte((byte_pointer)(&(data)),sizeof(float));
#define show_bytes_double_type(data)				show_byte((byte_pointer)(&(data)),sizeof(double));


int main(int argc, char **argv) {

	int a = 10;
	float b = -1;
	double d = 1;
	show_bytes_int_type(a)
	show_bytes_float_type(b)
	show_bytes_double_type(d)
	return 0;
}

