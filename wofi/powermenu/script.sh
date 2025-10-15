#!/usr/bin/env bash

LOCKFILE="/tmp/wofi-powermenu.lock"

if [ -e "$LOCKFILE" ]; then
    exit 0
fi

trap "rm -f '$LOCKFILE'" EXIT
touch "$LOCKFILE"

CHOICES="Shutdown
Reboot
Logout"

NUM_LINES=$(echo "$CHOICES" | wc -l)

CHOICE=$(echo "$CHOICES" | wofi \
	--dmenu \
	--hide-search \
	--lines "$NUM_LINES" \
	--style ~/.config/wofi/powermenu/style.css\
	--cache-file /dev/null)

case "$CHOICE" in
	Shutdown)
		systemctl poweroff
		;;
	Reboot)
		systemctl reboot
		;;
	Logout)
		hyprctl dispatch exit  # Hyprland logout
		;;
esac
