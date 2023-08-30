#!/usr/bin/env bash

LINK_TARGET="$HOME/img/wallpaper/.desktop"
PREVIOUS_BG="$(readlink -f $LINK_TARGET)"
WALLPAPERS=($HOME/img/wallpaper/*)

RANDPAPER="$(printf '%s\n' ${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]})"
while [[ "$RANDPAPER" == "$PREVIOUS_BG" ]]; do
    RANDPAPER="$(printf '%s\n' ${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]})"
done
ln -fs ${RANDPAPER} ${LINK_TARGET}
swaymsg -q "output * bg ${LINK_TARGET} fill"
