#!/bin/bash -i
source $(dirname $0)/bar/config.sh

(echo -e "^ca(1,scrun 'monitor laptop')^i($HOME/.icons/laptop.xbm)^ca()\n^ca(1,scrun 'monitor vga')^i($HOME/.icons/monitor.xbm)^ca()\n^ca(1,scrun 'monitor normal')^i($HOME/.icons/monitorlaptop.xbm)^ca()"; sleep 15;) \
| dzen2 -x 550 -y 400 -w 400 -bg $background -fg $foreground -fn $FONT -h 70 -sa c -l 3 -m h -e ""
