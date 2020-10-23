#!/bin/bash

cd /tmp/
wget https://files.dev47apps.net/linux/droidcam_latest.zip
echo "CHECK ..."
echo "73db3a4c0f52a285b6ac1f8c43d5b4c7 droidcam_latest.zip" | md5sum -c --
unzip droidcam_latest.zip -d droidcam && cd droidcam
sudo ./install

echo "CHECKING if Video Device Installed ..."
lsmod | grep v4l2loopback_dc

sudo ./install-sound
pacmd load-module module-alsa-source device=hw:Loopback,1,0

echo "ALL Good !!!"

droidcam
