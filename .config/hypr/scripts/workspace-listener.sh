#!/bin/bash

ws() {
	local urgent_workspace=""
	
	clients_data=$(hyprctl clients -j)
	
	urgent=$(echo $1 | grep -oP "urgent>>\K.*")
	if [ -n  "$urgent" ]; then
		urgent_workspace+=$(echo "$clients_data" | jq -r --argjson address "\"0x$urgent\"" '[.[] | select(.address == $address)] | .[0]?.workspace.id')
	fi

	if [ -n "$urgent_workspace" ]; then
		hyprctl dispatch workspace $urgent_workspace
	fi
}

XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
HYPRLAND_SIGNATURE_ACTUAL=$(ls -td "$XDG_RUNTIME_DIR/hypr/"*/ 2>/dev/null | head -n1 | xargs -r basename)

if [[ -z "$HYPRLAND_SIGNATURE_ACTUAL" ]]; then
	echo "No Hyprland socket found. Exiting."
	exit 1
fi

SOCKET="$XDG_RUNTIME_DIR/hypr/${HYPRLAND_SIGNATURE_ACTUAL}/.socket2.sock"

stdbuf -oL socat -U - UNIX-CONNECT:"$SOCKET" | while read -r line; do
	case $line in
	"urgent>>"*)
		ws $line
		;;
	esac
done
