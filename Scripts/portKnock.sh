#!/bin/sh
#This script takes target ip and ports as input to knock
#Once port knocking is complete an nmap scan will run to check open ports

#Check for number of arguments
if [ $# -lt 3 ]; then
	echo "[*] Syntax: ./portKnock.sh [ip] {[port 1] [port 2] .. [port3]}"
	exit 1
fi

#Save target ip and shift arguments
ip=$1
shift

#Port Knocking
for port in #@; do
	echo "[*] Knocking on port $port"
	nmap -Pn --host-timeout 201 --max-retries 0 -p $port $ip | grep "Nmap done:" && sleep 1
done

echo "[*] Scanning for open ports on $ip"

#Scan for open ports
nmap -Pn $ip