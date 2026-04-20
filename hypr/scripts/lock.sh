#!/bin/bash

VOL_FILE=/tmp/hypridle_vol_backup

case "$1" in
    --sleep)
        CURRENT=$(/home/YunKage/.config/hypr/scripts/volume.sh --get)
        echo $CURRENT > $VOL_FILE
        wpctl set-volume @DEFAULT_SINK@ 0%
        hyprctl switchxkblayout evision-rgb-keyboard 0 && hyprlock
        ;;

    --unsleep)
        if [ -f "$VOL_FILE" ]; then
            SAVED=$(cat $VOL_FILE)
            wpctl set-volume @DEFAULT_SINK@ "${SAVED}%"
            rm -f "$VOL_FILE"
        fi
        ;;
esac
