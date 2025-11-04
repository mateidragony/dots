#!/bin/bash

EWW_DIR="$HOME/.config/eww"
EWW=`which eww`

# load theme
THEME=$(cat $EWW_DIR/theme)
# cp $EWW_DIR/$THEME/* $EWW_DIR/

# run eww if not already running otherwise reload
if [[ ! `pidof eww` ]]; then
	${EWW} -c "$EWW_DIR/$THEME/" daemon
else
	${EWW} -c "$EWW_DIR/$THEME/" reload
fi

# get weather data
$EWW_DIR/scripts/weather_info.sh --getdata
sleep 1
	
# Open windows
WINDOWS=$(cat $EWW_DIR/$THEME/windows)
${EWW} -c "$EWW_DIR/$THEME/" open-many $WINDOWS
