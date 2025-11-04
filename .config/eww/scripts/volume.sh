#!/bin/bash

audio_sink="@DEFAULT_SINK@"
audio_source="@DEFAULT_SOURCE@"

# Get Volume
get_volume() {
	volume=$(wpctl get-volume $audio_sink)
	percent=$(echo $volume | rg -oP "Volume: ([0-9]+\.[0-9]+)" -r '$1')
    muted=$(echo $volume | rg -oP "Volume: ([0-9]+\.[0-9]+) (\[MUTED\])" -r '$2')

	if [[ -n "$muted" ]]; then
		echo "{\"volume\" : $percent, \"muted\" : true}"
	else
		echo "{\"volume\" : $percent, \"muted\" : false}"
	fi
}

get_volume
