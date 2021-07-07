#!/bin/sh

for (( ; ; ))
do
	ssid=$(iwgetid -r)
	[[ ${#ssid} -le "8" ]] || ssid=$(echo $ssid | cut -c -8)"..."
	[[ $ssid == "" ]] && ssid="N/A" 
	echo $ssid
	sleep 5
done
