#! /bin/bash

# Install Dependencies

echo Installing Dependencies and Prerequisites
echo ""

# Install Mono
echo Installing Mono
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel

echo Installing wget
sudo apt install wget
echo Installing unzip
sudo apt install unzip
echo Installing Sqlite3
sudo apt install sqlite3
echo Installing Build Essentials
sudo apt install build-essential
echo Installing PAM Libraries
sudo apt install libpam0g-dev
echo ""

echo Dependency Installation Complete
echo ""

# Install OpenPDC
echo Downloading OpenPDC Version 2.9.148
wget https://github.com/GridProtectionAlliance/openPDC/releases/download/v2.9.148/openPDC-POSIX.zip
echo Unzipping Archive
unzip openPDC-POSIX.zip
echo Moving Unzipped dir to /opt
sudo mv openPDC /opt
echo Change Directory to /opt/openPDC
cd /opt/openPDC
echo Generate a certificate for the service
mono MonoGenCert.exe openPDC
# Enable local user auth for openPDC (must run as root):
sudo bash enable-security.sh
echo ""
