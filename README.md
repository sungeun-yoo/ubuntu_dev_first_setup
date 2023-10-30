# Initial Setup Script for Ubuntu

This repository contains a script to automate the installation of various software and tools on an Ubuntu system. 

## Overview

The `first_setup.sh` script provides an easy way to set up a new Ubuntu machine with essential software like Google Chrome, VSCode, Git, Docker, and many others. It also takes care of adding necessary repositories and permissions, ensuring a seamless setup process.

## Prerequisites

- Ubuntu or an Ubuntu-based distribution.
- A user account with sudo privileges.
- Internet connection.

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/[YOUR_USERNAME]/[YOUR_REPO_NAME].git
   cd [YOUR_REPO_NAME]

2. **Make the script executable:**
```
chmod +x first_setup.sh
```

3. **Run the script with your username and sudo password as arguments:**
```
./first_setup.sh [YOUR_USERNAME] [YOUR_SUDO_PASSWORD]
```


> 🚨 **Note:** It's generally not recommended to pass passwords directly in the command line for security reasons. This script is designed for convenience in a trusted environment. Always ensure you understand a script's content before executing it.

## Software and Tools Installed

- **System Tools:**
  - **Update & Upgrade**: Ensures your system is up-to-date.
  
- **Browsers:**
  - **Google Chrome**: A popular web browser.

- **Development Tools:**
  - **VSCode**: A code editor with a rich set of extensions.
  - **Git**: A distributed version control system.
  - **Docker**: A platform for developing, shipping, and running applications in containers.
  - **NVIDIA Docker Tools**: Enables GPU support within Docker containers.
  - **NVIDIA CUDA Toolkit**: Provides development and runtime libraries for GPU-accelerated computing.

- **Utilities:**
  - **Barrier**: Share a single mouse and keyboard between multiple computers.
  - **GNOME Tweak Tool**: Customize the GNOME desktop environment.
  - **Dash to Panel**: A GNOME shell extension for a more traditional taskbar.
  - **Guvcview**: A webcam application to test and capture video.
  - **SSH Server**: Securely connect to your machine remotely.
  - **Net-tools**: A collection of network utilities.
  - **Solaar**: Manage Logitech's Unifying Receiver devices.

- **Drivers:**
  - **NVIDIA GPU Drivers**: Essential drivers for NVIDIA graphics cards.

