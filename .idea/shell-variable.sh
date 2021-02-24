#!/bin/bash
myUrl="https://www.google.com"
your_name="tom"
str='这是单引号使用的字符串'
str1="Hello, I know you are \"$your_name\"! \n"
string="runoob is a great site"

echo $str1 #使用变量
echo $myUrl $str  ${your_name}
#将etc下目录文件名循环列出来
for file in $(ls /etc)

string="runoob is a great site"
#计算字符串的长度
echo ${#string}
#从字符串第 2 个字符开始截取 4 个字符：
echo ${#string:1:4}
#查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
echo `expr index "$string" io`

#shell数组，只支持一维数组，下标范围没有限制

array_name=(value0 value1 value2 value3)
#单独定义数组的各个分量
array_name[0]=value0
array_name[1]=value1
array_name[2]=value2
array_name[n]=valuen
#读取数组中的值
valuen=${array_name[n]}
#输出数组中的所有元素
echo ${array_name[@]}
#获取数组元素的个数
length=${#array_name[*]}

#获取数组单个元素的长度
lengthn=${#array_name[0]}
