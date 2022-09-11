#! /bin/bash

# Unregister openPDC as Daemon
cd /opt/openPDC
sudo bash register-openPDC.sh -u
echo Unregistered openPDC as Daemon

# Remove openPDC folder
cd /opt
sudo rm -rdf openPDC
echo Removed all OpenPDC Files

# Remove user cache
cd ~/.config/Grid\ Protection\ Alliance/
rm -rdf openPDCConsole
echo Removed User cache
