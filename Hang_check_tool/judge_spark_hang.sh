#!/bin/bash

first=`date +%s -d "2017-9-19 21:59:59"`
later=`date +%s -d "2017-9-19 22:01:00"`

RED='\033[0;31m'
NC='\033[0m' # No Color

num=0

while read line
do
	if [ $num -eq 0 ]
	then
		first=`date +%s -d "$line"`
		later=`date +%s -d "$line"`
		num=$((num+1))
	else
		later=`date +%s -d "$line"`
	fi
	
	seconds=$(($later-$first))
	#echo $seconds
	if [ $seconds -ge $2 ]
	then
		echo -e "${RED}Hang lines found:$line seconds:$seconds ${NC}"
	fi
	
	#echo $first
	#echo $later

	first=$later
done < $1
