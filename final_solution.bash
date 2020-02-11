#!/bin/bash

results=( $(grep -in '\*\|\*ELEMENT\|\*NODE\|\*\*' abakus.txt | awk -F ":" '{ print $1 }'))   

for (( i=0; i<(${#results[@]}-1); i++ ))
    do
        num=`expr $((results[$i+1])) - $((results[$i])) - 1`
        lines+=("$num")
done

linestotal=`wc -l < abakus.txt`
last=`expr $linestotal - $((results[-1]))`
lines+=("$last")

for (( i=0; i<(${#lines[@]}); i++ ))
    do
	taillines=$((lines[$i]))
	headlines=`expr $((result[$i])) + $((lines[$i]))`
	head -n "$headlines" abakus.txt | tail -n "$taillines" | cut -d ',' -f2- > "plik_numer_${i}.txt"  

done
 

