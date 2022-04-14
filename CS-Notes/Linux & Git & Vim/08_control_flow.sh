#!/bin/bash

# if else

# for
for loop in 1 2 3 4 5
do
    echo "the value is: $loop"
done

# while
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done

# until
echo "------------------"
a=0
until [ ! $a -lt 10 ]
do
    echo $a
    a=`expr $a + 1`
done

# case
echo "------------------"
echo "input 1 to 4"
echo "please input your number"
read aNum
case $aNum in
    1) echo "you select 1"
    ;;
    2) echo "you select 2"
    ;;
    3) echo "you select 3"
    ;;
    4) echo "you select 4"
    ;;
esac
    
# break
while :
do
    echo -n "input the number between 1 to 5"
    read aNum
    case $aNum in
        1|2|3|4|5) echo "the number you input is $aNum"
        ;;
        *) echo "the number you input is not bewteen in 1 to 5"
            break
        ;;
    esac
done

# contine

# case ... esac