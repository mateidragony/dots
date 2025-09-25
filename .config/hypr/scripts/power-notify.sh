#!/bin/bash

iDIR="$HOME/.icons/notifications"
notify_cmd="notify-send -h string:x-canonical-private-synchronous:power_notif"

CACHE_STATE="$HOME/.cache/power-notify.txt"
BAT_DIR="/sys/class/power_supply/BAT0"

format_time() {
    local hours_float=$1
	[[ $hours_float == .* ]] && hours_float="0$hours_float"
    local hours=${hours_float%.*}
	
    local minutes=$(printf "%.0f" "$(echo "($hours_float - $hours) * 60" | bc -l)")

    if [ "$minutes" -eq 60 ]; then
        minutes=0
        hours=$((hours + 1))
    fi

    printf "%dh %dm" "$hours" "$minutes"
}


notify() {
	CHARGE_NOW=$(cat $BAT_DIR/charge_now)
	CHARGE_FULL=$(cat $BAT_DIR/charge_full)
	CURRENT_NOW=$(cat $BAT_DIR/current_now)

	state=$(cat $BAT_DIR/status)
	old_state=$(cat $CACHE_STATE)
	percent=$(cat $BAT_DIR/capacity)
	hours_empty=$(echo "$CHARGE_NOW / ($CURRENT_NOW + 1)" | bc -l)
	hours_full=$(echo "($CHARGE_FULL - $CHARGE_NOW) / ($CURRENT_NOW + 1)" | bc -l)

	time_empty=$(format_time $hours_empty)
	time_full=$(format_time $hours_full)
	
	if [ "$state" = "Charging" ] && [ "$old_state" != "charging" ]; then
		$notify_cmd -u normal -i "$iDIR/battery-bolt.svg" "Battery charging" "Time to full: $time_full"
		echo "charging" > $CACHE_STATE
	elif [ "$state" = "Discharging" ] && [ $percent -lt 20 ] && [ "$old_state" != "low battery" ]; then
		$notify_cmd -u critical -i "$iDIR/battery-slash.svg" "BATTERY LOW" "Time to empty: $time_empty"
		echo "low battery" > $CACHE_STATE
	elif [ "$state" = "Discharging" ] && [ "$old_state" = "charging" ]; then
		$notify_cmd -u normal -i "$iDIR/battery-mid.svg" "Battery discharging" "Time to empty: $time_empty"
		echo "normal" > $CACHE_STATE
	elif [ "$state" = "Full" ] && [ "$old_state" != "full" ]; then
		$notify_cmd -u normal -i "$iDIR/battery-full.svg" "Battery full" "So much energy flowing in this machine right now."
		echo "full" > $CACHE_STATE
	elif [ "$state" = "Discharging" ]; then
		echo "normal" > $CACHE_STATE
	fi
}

run_n_times_in_minute() {
    local n=$1
    if ! [[ $n =~ ^[0-9]+$ ]] || [ "$n" -le 0 ]; then
        echo "Error: argument must be a positive integer" >&2
        exit 1
    fi

    local interval=$(echo "scale=4; 60 / $n" | bc -l)

    for ((i=1; i<=n; i++)); do
        notify
        # skip sleeping after last run
        if [ $i -lt $n ]; then
            sleep $interval
        fi
    done
}

run_n_times_in_minute "$1"
