#!/bin/sh
#该脚本用于beta环境api发布检测，防止不带snapshot后缀上传nexus占用版本
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
api_version=`mvn help:effective-pom|grep Building|awk '{print $4}'`
echo "发布api版本：$api_version"
echo "$api_version" | grep -i "-"
if [ $? -eq 0 ];then
        #api版本有"-"，需要有SNAPSHOT后缀,必须大写否则nexus会识别为release版本
	echo "$api_version"| grep  "SNAPSHOT"
	if [ $? -ne 0 ];then
		echo "SNAPSHOT拼写有误"
		exit 1;
	fi
	exit 0;
elif [ $? -ne 0 ];then
      echo "未检测到SNAPSHOT版本"
      exit 1;
fi

