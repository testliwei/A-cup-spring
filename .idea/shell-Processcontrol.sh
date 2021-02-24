#!/bin/bash
#else 分支没有语句执行，就不要写这个 else。
a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi

um1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo '两个数字相等!'
else
    echo '两个数字不相等!'
fi

#顺序输出当前列表中的数字：
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done
#顺序输出字符串中的字符：
for str in This is a string
do
    echo $str
done

#while 循环用于不断执行一系列命令，也用于从输入文件中读取数据
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
#while循环可用于读取键盘信息。下面的例子中，输入信息被设置为变量FILM，按<Ctrl-D>结束循环。
echo '按下 <CTRL-D> 退出'
echo -n '输入你最喜欢的网站名: '
while read FILM
do
    echo "是的！$FILM 是一个好网站"
done
#无限循环语法格式：
while true
do
    command
done


#until 循环执行一系列命令直至条件为 true 时停止。
a=0

until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done


#case ... esac 为多选择语句，与其他语言中的 switch ... case 语句类似，是一种多分枝选择结构，每个 case 分支用右圆括号开始，用两个分号 ;; 表示 break，即执行结束，跳出整个 case ... esac 语句，esac（就是 case 反过来）作为结束标记
site="runoob"

case "$site" in
   "runoob") echo "菜鸟教程"
   ;;
   "google") echo "Google 搜索"
   ;;
   "taobao") echo "淘宝网"
   ;;
esac

#脚本进入死循环直至用户输入数字大于5。要跳出这个循环
while :
do
    echo -n "输入 1 到 5 之间的数字:"
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
            break
        ;;
    esac
done


#continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。
while :
do
    echo -n "输入 1 到 5 之间的数字: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的!"
            continue
            echo "游戏结束"
        ;;
    esac
done