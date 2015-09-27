#!/bin/bash
source $(dirname $0)/bar/config.sh
WIDTH="180"
LINES="8"
XPOS=$(($XPOS-$WIDTH-10))
if [ $(cat /sys/class/net/enp0s25/operstate) = "up" ]; then
  essid=Kábel
  mac=$(ifconfig enp0s25 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
  mac=${mac^^}
  rate=$(ethtool enp0s25 | grep -i speed)
  rate="${rate//Speed: }"
  inet=$(ifconfig enp0s25 | sed -n "2p" | awk -F " " '{print $2}')
  netmask=$(ifconfig enp0s25 | sed -n "2p" | awk -F " " '{print $4}')
  broadcast=$(ifconfig enp0s25 | sed -n "2p" | awk -F " " '{print $6}')

   (echo " ^fg($white)Network"; echo " ^fg($highlight)$essid"; echo " Speed: ^fg($highlight)$rate ";  echo " IP: ^fg($white)$inet";  echo " Netmask: ^fg($white)$netmask";  echo " Broadcast: ^fg($white)$broadcast"; echo " MAC: ^fg($highlight)$mac";  echo " "; sleep 10) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'y
else
  essid=$(iwconfig wlp3s0 | sed -n "1p" | awk -F '"' '{print $2}')
  mode=$(iwconfig wlp3s0 | sed -n "1p" | awk -F " " '{print $3}')
  freq=$(iwconfig wlp3s0 | sed -n "2p" | awk -F " " '{print $2}' | cut -d":" -f2)
  mac=$(iwconfig wlp3s0 | sed -n "2p" | awk -F " " '{print $6}')
  qual=$(iwconfig wlp3s0 | sed -n "6p" | awk -F " " '{print $2}' | cut -d"=" -f2)
  lvl=$(iwconfig wlp3s0 | sed -n "6p" | awk -F " " '{print $4}' | cut -d"=" -f2)
  rate=$(iwconfig wlp3s0 | sed -n "3p" | awk -F "=" '{print $2}' | cut -d" " -f1)
  inet=$(ifconfig wlp3s0 | sed -n "2p" | awk -F " " '{print $2}')
  netmask=$(ifconfig wlp3s0 | sed -n "2p" | awk -F " " '{print $4}')
  broadcast=$(ifconfig wlp3s0 | sed -n "2p" | awk -F " " '{print $6}')

  (echo " ^fg($white)Network"; echo " ^fg($highlight)$essid"; echo " Freq: ^fg($highlight)$freq GHz ^fg() Band: ^fg($highlight)$mode"; echo " Down: ^fg($highlight)$rate MB/s  ^fg() Quality: ^fg($highlight)$qual"; echo " IP: ^fg($white)$inet";  echo " Netmask: ^fg($white)$netmask";  echo " Broadcast: ^fg($white)$broadcast"; echo " MAC: ^fg($highlight)$mac";  echo " "; sleep 10) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
fi
