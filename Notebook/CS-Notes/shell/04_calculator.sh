#!/bin/bash

val=`expr 2856 - 1530`
echo "diff is: $val"

# 1 calcuator case
a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a / b : $val"

val=`expr $a % $b`
echo "a % b : $val"

if [ $a == $b ]
then
    echo "a is equal b"
fi
if [ $a != $b ]
then
    echo "a is not equal b"
fi

# 2 relation operation
a=10
b=20
if [ $a -eq $b ]
then
    echo "$a -eq $b : a is equal b"
else
    echo "$a -eq $b : a is not equal b"
fi

# 3 boolean operation
a=10
b=10
if [ $a != $b ]
then
    echo "$a != $b : a is not equal b"
else
    echo "$a == $b : a is equal b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
    echo "$a is less than 100 and $b is more than 15: return true"
else
     echo "$a is less than 100 and $b is more than 15: return false"
fi

# 4 logical operation
a=10
b=10

if [[ $a -lt 100 && $b -gt 100 ]]
then
    echo "return true"
else
    echo "return false"
fi

# 5 string operation
a="abc"
b="efg"

if [ $a = $b ]
then
    echo "$a = $b : a is equal b"
else
    echo "$a = $b : a is not equal b"
fi
if [ $a != $b ]
then
    echo "$a != $b : a is not equal b"
else
    echo "$a != $b : a is equal b"
fi

6 file test operation
file="01_variables.sh"

if [ -r $file ]
then
    echo "file can be read"
else
    echo "file can not be read"
fi