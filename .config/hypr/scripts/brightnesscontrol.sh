#!/usr/bin/bash

# Icons
iDIR="$HOME/.icons/dunst"
notify_cmd="dunstify -u low -h string:x-dunst-stack-tag:obbacklight"

# Get Volume
get_brightness() {
    value=`brightnessctl g`
    echo "$value / 1000" | bc
}

# Get icons
get_icon() {
    current="$(get_brightness)"
    if [[ ("$current" -le "20") ]]; then
	icon="$iDIR/brightness-20.png"
    elif [[ ("$current" -ge "20") && ("$current" -le "40") ]]; then
	icon="$iDIR/brightness-40.png"
    elif [[ ("$current" -ge "40") && ("$current" -le "60") ]]; then
	icon="$iDIR/brightness-60.png"
    elif [[ ("$current" -ge "60") && ("$current" -le "80") ]]; then
	icon="$iDIR/brightness-80.png"
    elif [[ ("$current" -ge "80") && ("$current" -le "100") ]]; then
	icon="$iDIR/brightness-100.png"
    fi
}


# Notify
notify_user() {
    ${notify_cmd} -i "$icon" "Volume : $(get_brightness)%"
}

# bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 3%+
# bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 3%-


# Increase Brightness
inc_brightness() {
    brightnessctl s +5000 --min-value=1 && get_icon && notify_user
}

# Decrease Brightness
dec_brightness() {
    brightnessctl s 5000- --min-value=1 && get_icon && notify_user
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

