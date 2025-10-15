#!/usr/bin/env bash

CHOICES="Shutdown
Reboot
Logout"

NUM_LINES=$(echo "$CHOICES" | wc -l)

CHOICE=$(echo "$CHOICES" | wofi \
	--dmenu \
	--hide-search \
	--lines "$NUM_LINES" \
	--style ~/.config/wofi/powermenu/style.css)

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
