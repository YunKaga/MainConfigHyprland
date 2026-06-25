#!/bin/bash

KEYBOARD="evision-rgb-keyboard"
hyprctl switchxkblayout $KEYBOARD 0 &> /dev/null

if [[ $# == 1 ]]; then
    $1 2> /dev/null
elif [[ $# == 2 ]]; then
    $1 $2 2> /dev/null
fi
