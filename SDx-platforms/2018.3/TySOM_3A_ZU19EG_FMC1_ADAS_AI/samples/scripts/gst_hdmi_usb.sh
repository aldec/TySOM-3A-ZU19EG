#!/bin/sh

gst-launch-1.0 \
    v4l2src device=/dev/video0 force-aspect-ratio=false ! \
    "video/x-raw, width=640, height=480, format=YUY2, framerate=15/1, pixel-aspect-ratio=4/3" ! \
    videoconvert ! \
    "video/x-raw, width=640, height=480, format=BGR, framerate=15/1, pixel-aspect-ratio=4/3" ! \
    $1  need-cma-input=false ! \
    fpsdisplaysink video-sink=" kmssink sync=false plane-id=32 bus-id="a0040000.v_mix" render-rectangle=\"<0,0,640,480>\" " text-overlay=true sync=false
