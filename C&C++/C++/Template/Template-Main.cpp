/*头文件包含：………………………………………………………………………………………………………………………………………………………………………*/
#include "UniteHead.h"//包含本项目中所有宏定义、全局函数声明（不包全局变量和静态函数）
#include <stdio.h>


/*全局变量：………………………………………………………………………………………………………………………………………………………………………*/
int global;
extern int outer;

/*静态函数声明：………………………………………………………………………………………………………………………………………………………………………*/
extern void myFun();


/*源代码区：………………………………………………………………………………………………………………………………………………………………………*/
int main(int argc, char *argv[])
{
	myFun();
	while (1);
    return 0;
}

