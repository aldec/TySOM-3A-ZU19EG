#!/bin/sh

echo "0" > /proc/sys/kernel/printk

# return DRICard number
MONITOR_DP="/sys/class/drm/card*-DP*/status"
MONITOR_HDMI="/sys/class/drm/card*-HDMI*/status"
device=0
if [ $(cat ${MONITOR_DP} 2>/dev/null) = "connected" ]; then
    device=0
elif [ $(cat ${MONITOR_HDMI} 2>/dev/null) = "connected" ]; then
    device=1
    /usr/bin/modetest -D b0010000.v_mix >> /dev/null
    /usr/bin/timeout 5 /usr/bin/modetest -D b0010000.v_mix -s 36@34:1920x1080@AR24 -v
fi
echo device $device
# adjust xorg.conf
sed -i -e "s/\(Option\s\+\"DRICard\"\s\+\)\"[0-9]\+\"/\1\"${device}\"/" /etc/X11/xorg.conf
exit 0