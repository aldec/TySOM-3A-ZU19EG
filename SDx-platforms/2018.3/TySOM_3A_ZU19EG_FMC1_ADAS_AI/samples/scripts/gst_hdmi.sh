#!/bin/sh

if [ $# -lt 2 ] ; then
    echo -e "Usage:"
    echo -e "\t$0 src plugin  width height inframerate"
    echo -e "\tsrc : input file"
    echo -e "\tplugin : detection plugin(e.g. sdxtrafficdetect)"
    echo -e "\twidth : width of the input buffer, default 640"
    echo -e "\theight : height of the input buffer, default 480"
    echo -e "\tinframerate : framerate of the input buffer, default 10"
    exit
fi

WIDTH=640
HEIGHT=480
if [ $# -ge 4 ] ; then
    WIDTH=$3
    HEIGHT=$4
fi 

FRATE=25
if [ $# -ge 5 ] ; then
    FRATE=$5
fi 

gst-launch-1.0 \
    multifilesrc location=$1  loop=true ! \
    videoparse width=$WIDTH height=$HEIGHT format=bgr  framerate=$FRATE ! \
    $2  need-cma-input=false ! \
    fpsdisplaysink video-sink=" kmssink sync=false plane-id=32 bus-id="a0040000.v_mix" render-rectangle=\"<0,0,$WIDTH,$HEIGHT>\" " text-overlay=true sync=false
