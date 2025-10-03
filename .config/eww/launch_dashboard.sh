#!/bin/bash

EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	$HOME/.config/eww/scripts/weather_info --getdata
	
	${EWW} open-many \
		   clock \
		   weather \
		   todo \
		   system
}

run_eww
