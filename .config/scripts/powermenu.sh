#!/usr/bin/env bash

op=$(echo -e " Shutdown\n Reboot\n Sleep\n Lock\n Logout" | wofi -i --dmenu | awk '{print tolower($2)}')

case $op in
shutdown)
	systemctl poweroff
	;;
reboot)
	systemctl reboot
	;;
sleep)
	systemctl suspend
	;;
lock)
	hyprlock
	;;
logout)
	hyprctl dispatch exit
	;;
esac
