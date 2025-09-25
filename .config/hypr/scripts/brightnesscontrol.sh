#!/usr/bin/bash

# Icons
iDIR="$HOME/.icons/notifications"
notify_cmd="notify-send -u low -h string:x-canonical-private-synchronous:brightness_notif"

# Get Brightness
get_brightness() {
    value=`brightnessctl g`
	max=`brightnessctl m`
    echo "$value * 100 / $max" | bc
}

# Notify
notify_user() {
    ${notify_cmd} -i "$iDIR/brightness.svg" "Brightness : $(get_brightness)%"
}

# Increase Brightness
inc_brightness() {
    brightnessctl s +5% && notify_user
}

# Decrease Brightness
dec_brightness() {
    brightnessctl s 5%- && notify_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
    get_brightness
elif [[ "$1" == "--inc" ]]; then
    inc_brightness
elif [[ "$1" == "--dec" ]]; then
    dec_brightness
else
    echo "$(get_brightness)%"
fi

