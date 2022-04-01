#!/bin/bash
echo "Hello World !"
your_name="qinjx"
echo $your_name
echo ${your_name} # recommand all the variable add {}

str='this is a string'
your_name='runoob'
echo -e $str

# string
string='runoob is a great site' 
echo ${#string} # obtain length of string
echo ${string:1:4}

# array
array_name=(value0 value1 value2 value3)
echo ${array_name[@]}
echo ${array_name[1]}



