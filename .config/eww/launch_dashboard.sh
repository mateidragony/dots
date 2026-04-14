#!/bin/bash

EWW_DIR="$HOME/.config/eww"
EWW=`which eww`

# load theme
THEME=$(cat $EWW_DIR/theme)
# cp $EWW_DIR/$THEME/* $EWW_DIR/

# run eww if not already running
if [[ ! `pidof eww` ]]; then
	WINDOWS=$(cat $EWW_DIR/$THEME/windows)
	${EWW} -c "$EWW_DIR/$THEME/" open-many $WINDOWS
fi

# get weather data
$EWW_DIR/scripts/weather_info.sh --getdata
