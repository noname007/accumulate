# reference http://www.cnblogs.com/huangcong/archive/2011/08/29/2158268.html
# https://www.codecademy.com/en/tracks/python
# 
# http://www.linuxidc.com/Linux/2012-02/53764.htm
# 
# http://blog.csdn.net/andy812110/article/details/43153895
# print("hello world")

# a = input("a")

# 题目描述

# 请用python编写一个计算器的控制台程序，支持加减乘除、乘方、括号、小数点，运算符优先级为括号>乘方>乘除>加减，同级别运算按照从左向右的顺序计算。

# 输入描述

# 数字包括"0123456789"，小数点为"."，运算符包括：加("+"),减("-"),乘("*"),除("/"),乘方("^"),括号("()")
# 需要从命令行参数读入输入，例如提交文件为main.py，可以用python main.py 1+2-3+4的方式进行调用
# 输入需要支持空格，即 python main.py 1     +     2      -     3    +    4 也需要程序能够正确给出结果
# 输出描述

# 数字需要支持小数点，输出结果取10位有效数字，有效数字位数不足时不需要补0
# 对于格式不合法（例如括号不匹配，等等）的输入，输出 FORMAT ERROR
# 对于不符合运算符接收的参数范围（例如）的输入，输出VALUE ERROR
# 对于不在输入描述内的输入，输出INPUT ERROR
# 限制

# 所有测试用例中参与运算的非零数字输入的绝对值范围保证在 10^9-10^(-10) 之内, 应该输出运算结果时非零运算结果绝对值也保证在该范围内

# 样例

# 输入: 1 + 2 - 3 + 4

# 输出: 4

# 输入: 1 + 2 - 3 + 1 / 3

# 输出: 0.3333333333

# 输入: 1 + + 2

# 输出: FORMAT ERROR

# 输入: 1 / 0

# 输出: VALUE ERROR

# 输入: a + 1

# 输出: INPUT ERROR


# print(a)

delimiter = ''
# mylist = ['Brazil', 'Russia', 'India', 'China']
# print (delimiter.join(mylist))

import sys
# print ("脚本名：", sys.argv[0])
# for i in range(1, len(sys.argv)):
#     print ("参数", i, sys.argv[i] )
# print(delimiter.join(sys.argv[1:]))
# print(eval(sys.argv[1]))
# 
input_string  = delimiter.join(sys.argv[1:])

# print(input_string)



# check parence

brackets_pairs = True
for x in input_string:
	if x == '(' :
		brackets_pairs = False
	# elif brackets_pairs == False and x==')':
	elif  x==')':
		if brackets_pairs == False :
			brackets_pairs = True
		else :
			brackets_pairs = False
			break
# print(brackets_pairs)
if not brackets_pairs :
	print("FORMAT ERROR")
	sys.exit()
	# return

print(eval(input_string))
