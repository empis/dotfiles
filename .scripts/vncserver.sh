#!/bin/bash
source $HOME/.scripts/bar/config.sh
if [ "`ps cax | grep x0vncserver`" = "" ] 
then
	x0vncserver -display :0 -passwordfile ~/.vnc/passwd &
	$HOME/.config/bspwm/panel/notify %{F#32CD32}%{F-} VNC server zapnutý
else
	killall x0vncserver
	$HOME/.config/bspwm/panel/notify %{F#DC143C}%{F-} VNC server vypnutý
fi
