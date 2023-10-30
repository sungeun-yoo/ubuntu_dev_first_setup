#!/bin/sh

# 입력 인자 검증
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <sudo password>"
    exit 1
fi

username=$1
PASSWORD=$2

# sudo 명령을 실행하기 위한 함수
sudo_cmd() {
    echo ${PASSWORD} | sudo -S "$@"
}

# 시스템 업데이트
sudo_cmd apt update
sudo_cmd apt upgrade -y

# 패키지 설치 함수
install_package() {
    echo "Installing $1"
    shift
    sudo_cmd apt install -y "$@"
}

# Google Chrome 설치
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo_cmd dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Vscode, Git, Barrier, Docker 등의 설치
install_package "VSCode" curl
sudo_cmd sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/etc/apt/trusted.gpg.d/microsoft.gpg'
sudo_cmd sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo_cmd apt update
install_package "VSCode" code
install_package "Git" git
install_package "Barrier" barrier

# Docker 설치
curl -fsSL https://get.docker.com -o get-docker.sh
sudo_cmd sh get-docker.sh
rm get-docker.sh 
sudo_cmd usermod -aG docker ${username}

# NVIDIA Docker 도구 설치
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo_cmd apt update
install_package "NVIDIA Container Toolkit" nvidia-container-toolkit
sudo_cmd systemctl restart docker

# 그 외의 패키지 설치
install_package "GNOME Tweak Tool" gnome-tweak-tool
install_package "Dash to Panel" gnome-shell-extension-dash-to-panel
install_package "Guvcview" guvcview
install_package "SSH server" openssh-server
install_package "Net-tools" net-tools
install_package "Solaar" solaar

# Nvidia GPU Driver 및 CUDA 설치
sudo_cmd add-apt-repository ppa:graphics-drivers/ppa
sudo_cmd apt update
sudo_cmd ubuntu-drivers autoinstall
install_package "NVIDIA CUDA Toolkit" nvidia-cuda-toolkit

echo "Installation completed!"
