#!/bin/bash

# For eww windows that pop open and closed

EWW_DIR="$HOME/.config/eww"
EWW=`which eww`

# load theme
THEME=$(cat $EWW_DIR/theme)


calendar() {
	LOCK_FILE="$HOME/.cache/eww-calendar.lock"

	run() {
		$EWW -c "$EWW_DIR/$THEME/" open calendar
	}

	# Open widgets
	if [[ ! -f "$LOCK_FILE" ]]; then
		touch "$LOCK_FILE"
		run && echo "ok good!"
	else
		$EWW -c "$EWW_DIR/$THEME/" close calendar
		rm "$LOCK_FILE" && echo "closed"
	fi
}



if [ "$1" = "calendar" ]; then
	calendar
fi
