#!/bin/sh

# Note: modify the device property of v4l2src plugin according to your system 
#       which you can check with command "video_cmd -S"

gst-launch-1.0 \
    v4l2src device=/dev/video0 force-aspect-ratio=false ! \
    "video/x-raw, width=640, height=480, format=YUY2, framerate=15/1, pixel-aspect-ratio=4/3" ! \
    videoconvert ! \
    "video/x-raw, width=640, height=480, format=BGR, framerate=15/1, pixel-aspect-ratio=4/3" ! \
    sdxfacedetect ! \
    fpsdisplaysink video-sink=" kmssink sync=false plane-id=32 bus-id="a0040000.v_mix" render-rectangle=\"<0,0,640,480>\" " text-overlay=true sync=false
