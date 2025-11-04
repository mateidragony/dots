#!/bin/bash

signal=$(nmcli -t -f ACTIVE,SIGNAL dev wifi | awk -F: '/yes/ {print $2}')
essid=`nmcli -t -f NAME,DEVICE c show --active | grep wlp2s0 | cut -d: -f1 | sed 's/ \[.*\]//'`

icons=("󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 ")


if [ -z "$signal" ]; then
	status="disconnected"
	icon="󰤭 "
else
	status="connected"
	if [ "$signal" -lt 20 ]; then
		icon="${icons[0]}"
	elif [ "$signal" -lt 40 ]; then
		icon="${icons[1]}"
	elif [ "$signal" -lt 60 ]; then
		icon="${icons[2]}"
	elif [ "$signal" -lt 80 ]; then
		icon="${icons[3]}"
	else
		icon="${icons[4]}"
	fi
fi

echo "{\"status\": \"$status\", \"icon\": \"$icon\", \"essid\": \"$essid\" }"
