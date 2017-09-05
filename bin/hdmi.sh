#!/bin/sh

# This program runs a set of commands that activates HDMI1 connection
# and sets the appropriate resolution (Lenovo E431 laptop)

hdmi(){
    if [ "$1" = "on" ]
    then
        echo "HDMI1:on"
        xrandr --output HDMI1 --mode 1920x1080
    elif [ "$1" = "off" ]
    then
        echo "HDMI1:off"
        xrandr -s 1600x900
    else
        echo "examples:"
        echo "$ hdmi on  - enable  HDMI1 and set 1920x1080 resolution"
        echo "$ hdmi off - disable HDMI1 and set 1600x900  resolution"
    fi
}

hdmi $1
