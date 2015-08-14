#!/bin/bash
source $(dirname $0)/bar/config.sh
XPOS=$((1250 + $XOFFSET - 115))
WIDTH="110"
LINES="10"

datea=$(date +%a)
dateb=$(date +%b)
dated=$(date +%d)
datey=$(date +%Y)
calendar=$(cal $(expr $(date +%m) + 1 ) $(date +%Y))

(echo " "; echo "  ^fg($highlight)$datea $dateb $dated $datey"; echo ""; echo "$calendar"; sleep 15) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
