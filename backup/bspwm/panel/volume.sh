#!/bin/sh

case $1 in
    "lower")
        amixer -q set Master 5%-
        amixer get Master | awk -F'[]%[]' '/%/ { print $2 }' | head -n 1 >> /tmp/volume	
		;;
    "raise")
        amixer -q set Master 5%+
        amixer get Master | awk -F'[]%[]' '/%/ { print $2 }' | head -n 1 >> /tmp/volume	
		;;
	"mute")
		amixer -q set Master toggle
		amixer get Master | awk -F'[]%[]' '/%/ { print $5 }' | head -n 1 >> /tmp/volume
		;;
esac
