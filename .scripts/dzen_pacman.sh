#!/bin/bash
source $(dirname $0)/bar/config.sh
WIDTH="150"
XPOS=$(($XPOS-$WIDTH-10))
pacmanlines=$(pacman -Qu | wc -l)
LINES=$(( $pacmanlines + 2 ))

updates=$(pacman -Qu)

(echo "^fg($white)Updates"; echo "$updates"; echo " "; echo "^fg($white)Right click to update";sleep 15) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button2=exec:urxvtc;button3=exit'
