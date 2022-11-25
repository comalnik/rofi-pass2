#!/bin/sh
clip_clear=40


cd "$HOME"/.password-store || exit 0
pass_entries=$(find ./* -type f | cut -c 3- | awk -F ".gpg" '{print $1}')
pass_entry=$(echo -e "$pass_entries" | rofi -dmenu -i -p "Password") || exit 0
pe1=$(pass "$pass_entry")
line=$(printf '%s\n' "${pe1}" | rofi -dmenu -p "Enter to copy")
printf '%s' "${line}" | xclip -sel clip
sleep $clip_clear; printf '%s' "" | xclip -sel clip 
