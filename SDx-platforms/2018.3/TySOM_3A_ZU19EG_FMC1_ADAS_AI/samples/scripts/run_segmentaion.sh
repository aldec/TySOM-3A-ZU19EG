#!/bin/sh

echo "Copying video data to system memory, please wait..."
rm -rf /home/video
mkdir /home/video
cp -r /media/card/video/segmentation /home/video

./gst_hdmi.sh /home/video/segmentation/segmentation_512x256_1%04d sdxsegmentation 512 256