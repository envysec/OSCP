#!/bin/sh
#Performs initial scan, scan on all ports, and safe script and service scan on open ports found

#Check for ip
if [ -z $1 ]; then
	echo "[*] Syntax: ./portScan.sh [ip]"
	exit 1
fi

#Checks if nmap directory exists for scan outputs
#Creates directory if it does not exist
if [ ! -d nmap ]; then
	echo "[*] nmap directory does not exist. Creating directory..."
	mkdir nmap
fi

#Perform initial scan
echo "[*] Performing initial scan.."
nmap -sT -sV -sC $1 -oA nmap/initScan

#All ports scan
echo "[*] Performing all ports scan"
nmap -p- $1 -oA nmap/fullScan

#Parse fullScan.gnmap for open ports to use in safe scripts and service scan
ports="$(grep -oP '\d{1,5}/open' nmap/fullScan.gnmap | sort -u | cut -d '/' -f 1 | paste -sd , | tee nmap/ports.lst)"

#Safe scripts and service scan
echo "[*] Performing service scan..."
nmap -A --script safe -p $ports $1 -oA nmap/serviceScan
