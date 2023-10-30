#!/bin/sh

# Check if script is running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root using sudo."
    exit 1
fi

username=$(whoami)

# 패키지 설치 함수
install_package() {
    echo "Installing $1"
    shift
    apt install -y "$@"
}

# 시스템 업데이트
apt update
apt upgrade -y

# Google Chrome 설치
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Vscode, Git, Barrier, Docker 등의 설치
install_package "VSCode" curl
sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/etc/apt/trusted.gpg.d/microsoft.gpg'
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt update
install_package "VSCode" code
install_package "Git" git
install_package "Barrier" barrier

# Docker 설치
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh 
usermod -aG docker ${username}

# NVIDIA Docker 도구 설치
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list
apt update
install_package "NVIDIA Container Toolkit" nvidia-container-toolkit
systemctl restart docker

# 그 외의 패키지 설치
install_package "GNOME Tweak Tool" gnome-tweak-tool
install_package "Dash to Panel" gnome-shell-extension-dash-to-panel
install_package "Guvcview" guvcview
install_package "SSH server" openssh-server
install_package "Net-tools" net-tools
install_package "Solaar" solaar

# Nvidia GPU Driver 및 CUDA 설치
add-apt-repository ppa:graphics-drivers/ppa
apt update
ubuntu-drivers autoinstall
install_package "NVIDIA CUDA Toolkit" nvidia-cuda-toolkit

echo "Installation completed!"
