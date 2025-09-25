#!/usr/bin/bash

# Icons
iDIR="$HOME/.icons/notifications"
notify_cmd='notify-send -u low -h string:x-canonical-private-synchronous:volume_notif'

audio_sink="@DEFAULT_SINK@"
audio_source="@DEFAULT_SOURCE@"

# Get Volume
get_volume() {
    percent=$(wpctl get-volume $audio_sink | grep "Volume" | awk -F: '{print $2}')
    echo "$percent * 100" | bc | cut -d '.' -f1
}

# Get icons
get_icon() {
    current="$(get_volume)"
    if [[ "$current" -eq "0" ]]; then
		echo "$iDIR/volume-off.svg"
    elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
		echo "$iDIR/volume-min.svg"
    elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
		echo "$iDIR/volume-med.svg"
    elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
		echo "$iDIR/volume-max.svg"
    fi
}


# Notify
notify_user() {
    ${notify_cmd} -i "$(get_icon)" "Volume : $(get_volume)%"
}

# Increase Volume
inc_volume() {
    wpctl set-mute $audio_sink 0
    wpctl set-volume $audio_sink --limit 1.0 5%+ && notify_user
}

# Decrease Volume
dec_volume() {
    wpctl set-mute $audio_sink 0
    wpctl set-volume $audio_sink 5%- && notify_user
}

# Toggle Mute
toggle_mute() {
    if [[ `wpctl get-volume $audio_sink` != *"[MUTED]" ]]; then
		wpctl set-mute $audio_sink toggle && ${notify_cmd} -i "$iDIR/volume-mute.svg" "Mute"
    else
		wpctl set-mute $audio_sink toggle && ${notify_cmd} -i "$(get_icon)" "Unmute"
		echo "$notify_cmd -i \"$(get_icon)\" \"Unmute\""
    fi
}

# Toggle Mic
toggle_mic() {
    if [[ `wpctl get-volume $audio_source` != *"[MUTED]" ]]; then
	wpctl set-mute $audio_source toggle && ${notify_cmd} -i "$iDIR/microphone-mute.svg" "Microphone Switched OFF"
    else
	wpctl set-mute $audio_source toggle && ${notify_cmd} -i "$iDIR/microphone.svg+" "Microphone Switched ON"
    fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
    get_volume
elif [[ "$1" == "--inc" ]]; then
    inc_volume
elif [[ "$1" == "--dec" ]]; then
    dec_volume
elif [[ "$1" == "--toggle" ]]; then
    toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
    toggle_mic
else
    echo $(get_volume)%
fi

