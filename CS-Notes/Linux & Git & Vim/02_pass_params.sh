#!/bin/bash
# author:菜鸟教程
# url:www.runoob.com

# ./02_pass_params.sh 1 2 3
echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";

echo "-- \$* 演示 ---"
for i in "$*"; do
    echo $i # i means pass one param
done

echo "-- \$@ 演示 ---"
for i in "$@"; do # @ means pass three params
    echo $i
done