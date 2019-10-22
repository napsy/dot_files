#!/bin/bash

MODE_FILE=~/.monitor_mode
CUR_MODE=`cat $MODE_FILE`

# Get connected monitor names
DEVS=$(xrandr | grep "\bconnected" | awk '{print $1}' | grep -v "eDP-1")
IFS=$'\n' lines=($DEVS)
# first dev
#echo ${lines[0]}
case $CUR_MODE in
    "dock")
    echo "Switching to transport mode"
        # Switch to transport
        xrandr --output eDP-1 --auto --output ${lines[0]} --left-of ${lines[1]} --off --output ${lines[1]} --off
        echo "transport" > $MODE_FILE
    ;;
    "transport")
    echo "Switching to dock mode"
        #Switch to dock
        xrandr --output eDP-1 --off --output ${lines[0]} --left-of ${lines[1]} --auto --output ${lines[1]} --auto
        echo "dock" > $MODE_FILE
    ;;
esac
# Refresh background to fit new screen layout
feh --bg-scale ~/Pictures/universe.jpg
