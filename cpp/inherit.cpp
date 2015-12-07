#include <stdio.h>
#include <iostream>
using  namespace std;
// class XX{
// 	public
// }


// 函数重载
void echo(int a){
	cout<<a<<endl;
}

void echo(){
	cout<<"hello world!"<<endl;
}


class XX
{
public:
	XX();
	~XX();
	int a;
protected:


private:



	/* data */
};

class XX1 :XX
{
public:
	XX1();
	~XX1();
protected:
	

private:
	/* data */
};

int main(int argc, char const *argv[])
{
	// new C
	echo();
	echo(11);
	return 0;
}