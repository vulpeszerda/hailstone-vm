#!/bin/bash

EXTPACK='Oracle_VM_VirtualBox_Extension_Pack-5.0.14-105127.vbox-extpack'
echo 'deb http://download.virtualbox.org/virtualbox/debian trusty contrib' | sudo -S tee --append /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo -S apt-key add -
sudo -S apt-get update && sudo apt-get install VirtualBox-5.0
wget -q "http://download.virtualbox.org/virtualbox/5.0.14/$EXTPACK"
sudo -S vboxmanage extpack install "$EXTPACK"
rm "$EXTPACK"

