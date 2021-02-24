#!/bin/sh
#该脚本检测发正式环境api代码不允许引用snapshot版本
#检查应用状态
function check_exit()
{
	if [ $? == "0"  ];then
	echo  "$1"
	exit 0
	else
	echo   "$2"
	fi
}

if [ $# != 0  ];then
echo "无需传入参数"
exit 1;
fi

artifactId=""
version=""
res=""

for str in `mvn help:effective-pom  | grep "<version>" -B1 | sed "/--/d"` ;
do
	echo "$str" | grep "<version>" | grep -i "SNAPSHOT" > /dev/null
    	if [ $? -eq 0 ];then
		version=`echo $str | sed "s#<version>##g;s#</version>##g"`
		res=${res}${artifactId}"_"${version}" "

		echo "${artifactId}"
		echo "$version"
	fi
	artifactId=`echo $str | sed "s#<artifactId>##g;s#</artifactId>##g"`
done

[[ ${res}"x" ==  "x" ]]
check_exit "snapshot检查通过" "snapshot检查失败,jar包如上"
exit 1
