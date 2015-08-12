#!/bin/bash -i
source $(dirname $0)/bar/config.sh

(echo -e "Menu\n^ca(1,power suspend)Uspat^ca()\n^ca(1,power hibernate)Hibernovat^ca()\n^ca(1,power off)Vypnút^ca()\n^ca(1,power restart)Restartovat^ca()"; sleep 15) \
| dzen2 -x 0 -y 0 -w 100 -bg $background -fg $foreground -fn $FONT -h 14 -sa c -l 4 -e 'onstart=uncollapse,hide' -m v
