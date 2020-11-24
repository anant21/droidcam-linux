#!/bin/bash

cd /tmp/
wget https://files.dev47apps.net/linux/droidcam_latest.zip

unzip droidcam_latest.zip -d droidcam && cd droidcam
sudo ./install-client

sudo apt install linux-headers-`uname -r` gcc make
sudo apt autoremove

sudo ./install-video

echo "CHECKING if Video Device Installed ..."
lsmod | grep v4l2loopback_dc

sudo ./install-sound
pacmd load-module module-alsa-source device=hw:Loopback,1,0

echo "ALL Good !!!"

droidcam
