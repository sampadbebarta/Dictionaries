#!/bin/bash

function rollDice() {

	echo $((RANDOM%6+1))
}


function diceLog() {
	if [ -v dice["$1"] ]
	then
		dice["$1"]=$(( ${dice["$1"]}+1 ))

		if [ ${dice["$1"]} -eq 10 ]
		then
			i=0
		fi
	else
		dice["$1"]=1
	fi
}


function maxMinOccurance() {
	for var in ${!dice[@]}
	do
		if [ ${dice[$var]} -ge $counterMax ]
		then
			counterMax=${dice[$var]}
			max=$var
		fi

		if [ $var -le $counterMin ]
		then
			counterMin=${dice[$var]}
			min="$var"
		fi
	done
}


function printList() {
	for var in ${!dice[@]}
	do
		echo "$var : ${dice[$var]}"
	done
}


i=1
max=0
min=0
counterMax=0
counterMin=11


declare -A dice


while [ $i -eq 1 ]
do
	temp=$( rollDice )
	diceLog $temp
done


maxMinOccurance


printList ${dice[@]}
echo "Maximum occurance : $max occured $counterMax times"
echo "Minimum occurances : $min occoured $counterMin times"
