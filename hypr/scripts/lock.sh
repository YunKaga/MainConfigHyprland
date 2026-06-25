#!/bin/bash

VOL_FILE=/home/YunKage/.config/hypr/scripts/var/hypridle_vol_backup
CURRENT=$(/home/YunKage/.config/hypr/scripts/volume.sh --get)
KEYBOARD="evision-rgb-keyboard"

case "$1" in
    --sleep)
        if [[ $CURRENT -ne 0 ]]; then
            echo $CURRENT > $VOL_FILE
            wpctl set-volume @DEFAULT_SINK@ 0%
        fi
        hyprctl switchxkblayout $KEYBOARD 0 && hyprlock
        ;;

    --unsleep)
        SAVED=$(cat $VOL_FILE)
        if [[ $SAVED -ne 0 ]]; then
            wpctl set-volume @DEFAULT_SINK@ "${SAVED}%"
        else
            wpctl set-volume @DEFAULT_SINK@ "22%"
        fi
        ;;

    --from-idle)
        if [[ $(playerctl -p spotify status) != "Playing" ]]; then
            if [[ $CURRENT -ne 0 ]]; then
                wpctl set-volume @DEFAULT_SINK@ 0%
            fi
        fi
        echo $CURRENT > $VOL_FILE
        hyprctl switchxkblayout $KEYBOARD 0 && hyprlock
        ;;
esac
