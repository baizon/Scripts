#!/bin/sh

DEVICE_ID=$(xinput | grep "Synaptics TouchPad" | grep -o -P 'id.{0,10}' | cut -c 4-10 | grep -o -P '^[\S]+')
INPUT=$(xinput list-props $DEVICE_ID | grep "Device Enabled" | tail -c2)

if [ "$INPUT" = "1" ]; then
 xinput set-prop 13 "Device Enabled" 0
 notify-send "Touchpad" "Touchpad disabled." -i /usr/share/app-install/icons/input-mouse.svg
else
 xinput set-prop 13 "Device Enabled" 1
 notify-send "Touchpad" "Touchpad enabled." -i /usr/share/app-install/icons/input-mouse.svg
fi
