#!/usr/bin/env bash

gd=`date +%j`
gy=`date +%Y`

# fix bash treating some numbers as octals
let "gd=10#${gd}"
let "gy=10#${gy}"

m=$((gd / 73))
d=$(((gd - 1) % 73))
u=$((d % 5))
Y=$((gy + 1166))

F=("a" "A" "b" "B" "C" "d" "m" "u" "y" "Y")

# locale's abbreviated weekday name (e.g., SM)
function a {
	arr=("SM" "BT" "PD" "PP" "SO")
	echo "${arr[$u]}"
}

# locale's full weekday name (e.g., Sweetmorn)
function A {
	arr=("Sweetmorn" "Boomtime" "Pungenday" "Prickle-Prickle" "Setting Orange")
	echo "${arr[$u]}"
}

# locale's abbreviated season name (e.g., Chs)
function b {
	arr=("Chs" "Dsc" "Cfn" "Bcy" "Afm")
	echo "${arr[m]}"
}

# locale's full season name (e.g., Chaos)
function B {
	arr=("Chaos" "Discord" "Confusion" "Bureaucracy" "The Aftermath")
	echo "${arr[m]}"
}

# century; like %Y, except omit last two digits (e.g., 20)
# FIX: Y10K problem
function C {
	echo "${Y:0:2}"
}

# day of season (e.g, 01)
function d {
	echo $((d+1))
}

# day of week (1..5); 1 is Sweetmorn
function u {
	echo "$u"
}

# season (0..5)
function m {
	echo "$m"
}

# last two digits of year (00..99)
function y {
	echo "${Y:2}"
}

# year
function Y {
	echo "$Y"
}

out="$1"

if [ -z "$out" ]; then
	out="Today is %A, the %d. day of %B in the YOLD %Y"
fi

out=`echo "$out" | sed "s/^+//"`

for f in ${F[@]}; do
	e=`eval $f`
	out=`echo "$out" | sed "s/%$f/$e/g"`
done

echo "$out"
