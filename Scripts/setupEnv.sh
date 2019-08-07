#!/bin/sh
#Set up Kali environment for CTF/Pentest

###################
#Setup Directories#
###################

if [ ! -d ~/Documents/VPNs ]; then
	echo "[*] Creating VPNs directory..."
	mkdir ~/Documents/VPNs
fi

if [ ! -d ~/Documents/HTB ]; then
	echo "[*] Creating HTB directory..."
	mkdir ~/Documents/HTB
fi

if [ ! -d ~/Documents/OSCP/lab ]; then
	echo "[*] Creating OSCP lab directory..."
	mkdir -p ~/Documents/OSCP/lab
fi

if [ ! -d ~/Documents/OSCP/PWK ]; then
	echo "[*] Creating PWK directory..."
	mkdir -p ~/Documents/OSCP/PWK
fi

################
#Create Aliases#
################

echo "[*] Writing in .bash_aliases..."
echo "alias gotoHTB='cd ~/Documents/HTB'" >> ~/.bash_aliases
echo "alias gotoOSCP='cd ~/Documents/OSCP'" >> ~/.bash_aliases
echo "alias gotoVPN='cd ~/Documents/VPNs'" >> ~/.bash_aliases
echo "alias multiply='gnome-terminal;gnome-terminal;gnome-terminal'" >> ~/.bash_aliases
echo "alias pbcopy='xclip -selection clipboard'" >> ~/.bash_aliases
echo "alias pbpaste='xclip -selection clipboard -o'" >> ~/.bash_aliases

##########################
#Download Tools Into /opt#
##########################

cd /opt

#Download Seclist
git clone https://github.com/danielmiessler/SecLists.git && echo "[*] SecLists downloaded"

#Download Nishang
git clone https://github.com/samratashok/nishang.git && echo "[*] Nishang downloaded"

#Download Empire Dev Branch
git clone https://github.com/EmpireProject/Empire.git && echo "[*] Empire dev branch downloaded"

#Download LinEnum
git clone https://github.com/rebootuser/LinEnum.git && echo "[*] LinEnum downloaded"

#Download LinuxPrivChecker
git clone https://github.com/sleventyeleven/linuxprivchecker.git && echo "[*] LinuxPrivChecker downloaded"

#Download Unicorn
git clone https://github.com/trustedsec/unicorn.git && echo "[*] Unicorn downloaded"

#Download Gobuster
git clone https://github.com/OJ/gobuster.git && echo "[*] Gobuster downloaded"

#Download PowerSploit
git clone https://github.com/PowerShellMafia/PowerSploit.git && echo "[*] PowerSploit downloaded"
