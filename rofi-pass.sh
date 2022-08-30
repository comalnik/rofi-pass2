#!/bin/sh

cd "$HOME"/.password-store || exit 0
pass_entries=$(find ./* -type f | cut -c 3- | awk -F ".gpg" '{print $1}')



pass_entry=$(echo "$pass_entries" | rofi -dmenu -i -p "pass") || exit 0
pe1=$(pass "$pass_entry")




#pe2=$(echo "$pe1" | rofi -dmenu -i -p) || exit 0

bla=$(printf '%s\n' "${pe1}" | rofi -dmenu -mesg "Enter: Copy entry to clipboard" -p "> ")

printf '%s' "${pe1}" | xclip -sel clip




#xdotool type "$(pass show "$pass_entry")"

