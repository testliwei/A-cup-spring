#!/bin/sh
#该脚本废弃使用，将原有逻辑拆分到check_api_in_snap/check_api_no_snap
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
    echo "发布snapshot版本api，无需check snapshot"
    echo "$api_version"| grep -i "SNAPSHOT"
    if [ $? -ne 0 ];then
        echo "SNAPSHOT拼写有误"
        exit 1;
    fi
    exit 0;
fi
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
