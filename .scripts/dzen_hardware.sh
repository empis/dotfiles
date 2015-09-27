#!/bin/bash
source $(dirname $0)/bar/config.sh
WIDTH="260"
LINES="15"
XPOS=$(($XPOS-$WIDTH-10))

cputemp="^fg($white0)^i($HOME/.icons/temp.xbm)^fg() Teplota ^fg($highlight)$(sensors | grep "temp1" | cut -d'+' -f2 | head -c2)°C"
cpuutiluser=$(iostat -c | sed -n "4p" | awk -F " " '{print $1}')
cpuutilsystem=$(iostat -c | sed -n "4p" | awk -F " " '{print $3}')
cpuutilidle=$(iostat -c | sed -n "4p" | awk -F " " '{print $6}')
ramtotal=$(free -m | sed -n "2p" | awk -F " " '{print $4}')
ramused=$(free -m | sed -n "2p" | awk -F " " '{print $3}')
uptime=$(</proc/uptime)
uptime=${uptime//.*}
secs=$((${uptime}%60))
mins=$((${uptime}/60%60))
hours=$((${uptime}/3600%24))
days=$((${uptime}/86400))
uptime="${mins}m"
if [ "${hours}" -ne "0" ]; then
	uptime="${hours}h ${uptime}"
fi
if [ "${days}" -ne "0" ]; then
	uptime="${days}d ${uptime}"
fi
kernel="^fg($white0)^i($HOME/.icons/arch_10x10.xbm)^fg() Kernel ^fg($highlight)$(uname -r)"
packages="^fg($white0)^i($HOME/.icons/pacman.xbm)^fg() Balíky ^fg($highlight)$(pacman -Q | wc -l)"
uptime="^fg($white0)^i($HOME/.icons/net_up_01.xbm)^fg() Uptime ^fg($highlight)$uptime"

hddtitle=$(df -h | head -1)
hddtotal=$(df -h --total | tail -1)
#toptitle=$(top -bn1 | grep PID | cut -b1-5,42-) 
#top=$(top -bn1 | tail -n+8 | sort -k9nr -k10nr | cut -b1-5,42- | grep -v "chromium" | head -n8)

cpu_bar_total=`$HOME/.scripts/bar/bar_cpu.sh 0`
cpu_bar_0=`$HOME/.scripts/bar/bar_cpu.sh 1`
cpu_bar_1=`$HOME/.scripts/bar/bar_cpu.sh 2`
cpu_bar_2=`$HOME/.scripts/bar/bar_cpu.sh 3`
cpu_bar_3=`$HOME/.scripts/bar/bar_cpu.sh 4`

mem_bar=`$HOME/.scripts/bar/bar_ram_lg.sh`

sda_bar=`$HOME/.scripts/bar/bar_disk.sh /dev/sda`

(echo " ^fg($highlight)Systém"; echo "              $kernel"; echo "        $packages   $uptime"; echo " "; echo " $cpu_bar_0"; echo " $cpu_bar_1"; echo " $cpu_bar_2"; echo " $cpu_bar_3"; echo "                 $cputemp"; echo " ";  echo " $mem_bar"; echo "                 ^fg($highlight)$ramused MB / $ramtotal MB"; echo " "; echo " $sda_bar"; sleep 10) | dzen2 -fg $foreground -bg  $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
