#!/bin/sh

echo "Copying video data to system memory, please wait..."
rm -rf /home/video
mkdir /home/video
cp -r /media/card/video/traffic /home/video

./gst_hdmi.sh /home/video/traffic/traffic_480x360_1%04d sdxtrafficdetect 480 360