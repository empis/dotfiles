#!/bin/sh

export DISPLAY=:0
export XAUTHORITY=/home/empis/.Xauthority
export HOME=/home/empis
export USER=empis

VGA=$(cat /sys/class/drm/card0-VGA-1/status)

if [ $VGA == "connected" ] 
then
	$HOME/.scripts/monitor vga
else
	$HOME/.scripts/monitor laptop
fi
