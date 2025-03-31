#!/usr/bin/env bash

DIR="$HOME/.config/rofi"
RASI="$DIR/emoji.rasi"


rofi_cmd() {
    rofimoji --only-official \
	     --prompt "" \
	     --action {type,copy} \
	     --hidden-descriptions \
	     --max-recent 0 \
	     --selector-args="-theme $RASI
	     			     -kb-row-left Left
				     -kb-row-right Right
				     -kb-move-char-back Control+b
				     -kb-move-char-forward Control+f"
}

rofi_cmd
