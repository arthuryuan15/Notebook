#!/bin/bash

# test number
num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo "two number is same!"
else
    echo "two number is not same"
fi

# test file
cd /home/yjs/learn
if test -e README
then
    echo 'file is existing'
else
    echo 'file is not existing'
fi