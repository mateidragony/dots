DIR="$HOME/.config/rofi"
RASI="$DIR/launcher-3.rasi"

rofi_cmd() {
    rofi -a -show drun -theme $RASI
}

rofi_cmd
