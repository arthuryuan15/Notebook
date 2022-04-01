#!/bin/bash
# author:arthur

funWithReturn(){
    echo "this function is for adding two number"
    echo "input frist number"
    read aNum
    echo "input second number"
    read anotherNum
    echo "two number is $aNum and $anotherNum"
    return $(($aNum+$anotherNum))
}

funWithReturn
echo "the sum of two number is $? !"