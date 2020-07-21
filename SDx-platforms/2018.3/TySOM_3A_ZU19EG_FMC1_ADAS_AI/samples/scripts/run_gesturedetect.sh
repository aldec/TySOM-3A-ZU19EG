#!/bin/sh

echo "Copying video data to system memory, please wait..."
rm -rf /home/video
mkdir /home/video
cp -r /media/card/video/gesture /home/video

./gst_hdmi.sh /home/video/gesture/gesture_640x480_1%04d sdxgesturedetect 640 480