# Ubuntu First Setup Script

This repository contains a script for setting up essential tools and packages on a fresh Ubuntu installation.

## Features

- Automatically installs commonly used software and tools.
- Uses `sudo` for elevated permissions, ensuring secure package installation.
- Automatically detects the username of the executing user.

## Installed Software and Tools

- System Update & Upgrade
- Google Chrome: Popular web browser.
- VSCode: Code editor with a rich set of extensions.
- Git: Version control system.
- Barrier: Tool to share a single mouse and keyboard between multiple computers.
- Docker: Platform for developing, shipping, and running applications in containers.
- NVIDIA Docker Tools: Enables GPU support within Docker containers.
- GNOME Tweak Tool: Tool to customize the GNOME desktop environment.
- Dash to Panel: GNOME shell extension for a more traditional taskbar.
- NVIDIA GPU Drivers: Drivers for NVIDIA graphics cards.
- NVIDIA CUDA Toolkit: Development and runtime libraries for GPU-accelerated computing.
- Guvcview: Webcam application to test and capture video.
- SSH Server: Securely connect to your machine remotely.
- Net-tools: Collection of network utilities.
- Solaar: Manage Logitech's Unifying Receiver devices.

## Usage

1. **Clone this repository:**
   ```bash
   git clone https://github.com/[YOUR_USERNAME]/[YOUR_REPO_NAME].git
   cd [YOUR_REPO_NAME]


2. **Make the script executable:**
```
chmod +x first_setup.sh
```

3. **Run the script with your username and sudo password as arguments:**
```
sudo ./first_setup.sh
```
