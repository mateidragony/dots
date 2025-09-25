#!/bin/bash

MORNING=4
NIGHT=20

hour=$(date +%H)
if [ "$hour" -ge $MORNING ] && [ "$hour" -lt $NIGHT ]; then
    brightnessctl set 40%
else
    brightnessctl set 15%
fi



