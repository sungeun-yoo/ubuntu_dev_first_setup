#!/bin/sh

if [ ! "$#" -eq "2" ]
then
	echo "Please enter username as the first argument and su password as the second argument"
	echo "  Ex) sh ./first_setup.sh mindforge *******"
	exit
fi
username=$1
PASSWORD=$2

echo ${PASSWORD} | sudo -S  apt update
echo ${PASSWORD} | sudo -S  apt upgrade -y

# Chrome
echo "Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo ${PASSWORD} | sudo -S  dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Vscode
echo "vscode"
echo ${PASSWORD} | sudo -S  apt-get install -y curl
echo ${PASSWORD} | sudo -S  sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/etc/apt/trusted.gpg.d/microsoft.gpg'
echo ${PASSWORD} | sudo -S  sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' 
echo ${PASSWORD} | sudo -S  apt update
echo ${PASSWORD} | sudo -S  apt install -y code

# Git
echo "git"
echo ${PASSWORD} | sudo -S  apt install -y git

# Barrier
echo "barrier"
echo ${PASSWORD} | sudo -S  apt install -y barrier

# Docker
echo "docker"
curl -fsSL https://get.docker.com -o get-docker.sh
echo ${PASSWORD} | sudo -S  sh get-docker.sh
rm get-docker.sh 
echo ${PASSWORD} | sudo -S  usermod -aG docker ${username}

# Docker container toolkit
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - 
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
echo ${PASSWORD} | sudo -S apt-get update 
echo ${PASSWORD} | sudo -S apt-get install -y nvidia-container-toolkit
echo ${PASSWORD} | sudo -S systemctl restart docker

# Gnome tweak tool
echo "gnome tweak tool"
echo ${PASSWORD} | sudo -S apt-get install -y gnome-tweak-tool
# Dash to panel
echo ${PASSWORD} | sudo -S apt-get install -y gnome-shell-extension-dash-to-panel


# Nvidia GPU Driver
echo "Nvidia GPU Driver"
echo ${PASSWORD} | 
-S add-apt-repository ppa:graphics-drivers/ppa
echo ${PASSWORD} | sudo -S apt update
echo ${PASSWORD} | sudo -S ubuntu-drivers autoinstall

# Nvidia cuda toolkit
echo "Nvidia cuda toolkit"
echo ${PASSWORD} | sudo -S apt install -y nvidia-cuda-toolkit

# Guvcview
echo "Guvcview"
echo ${PASSWORD} | sudo -S apt install -y guvcview

# SSH server
echo "Ssh server"
echo ${PASSWORD} | sudo -S apt install openssh-server

# Net-tools
echo "Net-tools"
echo ${PASSWORD} | sudo -S apt install net-tools

