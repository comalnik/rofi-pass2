#!/bin/sh
cd "$HOME"/.password-store || exit 0
pass_entries=$(find ./* -type f | cut -c 3- | awk -F ".gpg" '{print $1}')

#pes1=$("Insert new password""$pass_entries")


pass_entry=$(echo "$pass_entries" | rofi -dmenu -i -p "pass❯") || exit 0
pe1=$(pass "$pass_entry")
line=$(printf '%s\n' "${pe1}" | rofi -dmenu -p "Enter to copy❯")
printf '%s' "${line}" | xclip -sel clip


