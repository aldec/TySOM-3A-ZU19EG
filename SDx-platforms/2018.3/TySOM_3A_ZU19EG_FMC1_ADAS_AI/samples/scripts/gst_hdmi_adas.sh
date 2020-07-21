#!/bin/sh

WIDTH=1280
HEIGHT=720

gst-launch-1.0 \
  v4l2src device=/dev/video0 io-mode=4 ! rawvideoparse width=$WIDTH height=$HEIGHT format=bgr framerate=30/1 ! queue ! \
  $1 need-cma-input=false ! queue ! \
  fpsdisplaysink video-sink=" kmssink sync=false plane-id=29 bus-id="a0040000.v_mix" fullscreen-overlay=true render-rectangle=\"<0,0,$WIDTH,$HEIGHT>\" " text-overlay=true sync=false



