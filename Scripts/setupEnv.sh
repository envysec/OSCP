#!/bin/sh
#Set up Kali environment for CTF/Pentest

###########
#Functions#
###########

checkDir() {
	if [ ! -d ~/Documents/$1 ]; then
		echo "[*] Creating $1 directory..."
		mkdir ~/Documents/$1
	else
		echo "[*] ~/Documents/$1 directory already exists"
	fi
}

###################
#Setup Directories#
###################

checkDir VPNs
checkDir VPNs/ELS
checkDir HTB
checkDir OSCP/lab
checkDir OSCP/PWK
checkDir ELS

################
#Create Aliases#
################

echo "[*] Writing in .bash_aliases..."
echo "alias gotoHTB='cd ~/Documents/HTB'" >> ~/.bash_aliases
echo "alias gotoOSCP='cd ~/Documents/OSCP'" >> ~/.bash_aliases
echo "alias gotoVPN='cd ~/Documents/VPNs'" >> ~/.bash_aliases
echo "alias gotoELS='cd ~/Documents/ELS'" >> ~/.bash_aliases
echo "alias multiply='gnome-terminal;gnome-terminal;gnome-terminal'" >> ~/.bash_aliases
echo "alias pbcopy='xclip -selection clipboard'" >> ~/.bash_aliases
echo "alias pbpaste='xclip -selection clipboard -o'" >> ~/.bash_aliases
echo "alias ll='ls -la'" >> ~/.bash_aliases

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

#Download Windows Exploits
git clone https://github.com/abatchy17/WindowsExploits.git && echo "Windows Exploits downloaded"

#Download Sherlock
git clone https://github.com/rasta-mouse/Sherlock.git && echo "Sherlock downloaded"

#############
#Path Change#
#############

echo 'export PATH="$PATH:/opt/OSCP/Scripts"' >> ~/.bashrc
echo "[*] Added export line to .bashrc"

#################
#Enable Services#
#################

#Start/Enable Postgresql
echo "[*] Checking if postgres is running"
pgrep postgres
if [ $? -eq 1 ]; then
	echo "[*] postgres is not running"
	echo "[*] Enabling postgres"
	systemctl enable postgresql
	echo "[*] Starting postgres"
	systemctl start postgresql
else
	echo "[*] postgres is already running"
fi

#Start/Enable SSH
echo "[*] Checking if sshd is running"
pgrep sshd
if [ $? -eq 1 ]; then
	echo "[*] sshd is not running"
	echo "[*] Enabling sshd"
	systemctl enable ssh
	echo "[*] Starting sshd"
	systemctl start ssh
else
	echo "[*] sshd is already running"
fi
