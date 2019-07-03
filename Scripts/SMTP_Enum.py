#!/usr/bin/python

import socket
import sys

if len(sys.argv) != 3:
	print "Usage: vrfy.py <wordlist> <ip>"
	sys.exit(1)

#Read Wordlist
wordlist = open(sys.argv[1], "r")

#Create a Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

#Connect to Server
connect = s.connect((sys.argv[2],25))

#Receive Banner
banner = s.recv(1024)
print banner

#VRFY each user in wordlist
for line in wordlist:
	s.send('VRFY ' + line.rstrip() + '\r\n')
	result = s.recv(1024)
	print result
	
#Close Socket
s.close()