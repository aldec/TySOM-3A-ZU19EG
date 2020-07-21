#!/bin/sh

echo "Copying video data to system memory, please wait..."
rm -rf /home/video
mkdir /home/video
cp -r /media/card/video/pedestrian /home/video

./gst_hdmi.sh /home/video/pedestrian/pedestrian_416x416_1%04d sdxpedestriandetect 416 416 
