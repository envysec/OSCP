#!/bin/bash
#Process monitor bash script
#Thank you ippsec (Got it from his videos)

#Set IFS to newline
IFS=$'\n'

#Set initial ps results
op=$(ps -eo command)

#Checks new process and compares to old
while true; do
	np=$(ps -eo command)
	diff <(echo "$op") <(echo "$np")
	sleep .2
	op=$np
done