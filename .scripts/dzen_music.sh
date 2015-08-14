#!/bin/bash
source $(dirname $0)/bar/config.sh
XPOS=$((1180 + $XOFFSET))
WIDTH="180"
LINES="9"

playing=$(mpc current)
art="$HOME/.config/ario/covers/$(ls ~/.config/ario/covers | grep SMALL | grep "$(mpc current -f %album% | sed 's/:/ /g')")"
if [[ -n $(mpc current -f  %artist%) ]] ; then artist=$(mpc current -f  %artist%) ; else artist="Neznámy"; fi
if [[ -n $(mpc current -f  %album%) ]] ; then album=$(mpc current -f  %album%) ; else album="Neznámy"; art="$HOME/.config/ario/covers/default.jpg"; fi
if [[ -n $(mpc current -f  %title%) ]] ; then track=$(mpc current -f  %title%) ; else track="Neznámy"; fi
if [[ -n $(mpc current -f  %date%) ]] ; then date=$(mpc current -f  %date%) ; else date="Neznámy"; fi
#stats=$(mpc stats)
#playlistcurrent=$(mpc playlist | grep -n "$playing" | cut -d ":" -f 1 | head -n1)
#nextnum=$(( $playlistcurrent + 1 ))
#prevnum=$(( $playlistcurrent - 1 ))
#next=$(mpc playlist | sed -n ""$nextnum"p")
#prev=$(mpc playlist | sed -n ""$prevnum"p")
#art=$(ls ~/.config/ario/covers | grep SMALL | grep $album)
echo $art;
if [ $art = "$HOME/.config/ario/covers/" ]
then
	art="$HOME/.config/ario/covers/default.jpg";
fi
perc=`mpc | awk 'NR == 2 {gsub(/[()%]/,""); print $4}'`
 
percbar=`echo -e "$perc" | gdbar -bg $bar_bg -fg $foreground -h 1 -w $(($WIDTH-20))`

#84x84
feh -x -B black -^ "" -g 116x116+$(($XPOS-116))+$(($YPOS+13)) -Z "$art" &
(echo "^fg($highlight)Music"; echo "       ";echo "^ca(1,$HOME/.scripts/dzen_lyrics.sh)  Skladba:  ^fg($highlight)$track^ca()"; echo "^ca(1,$HOME/.scripts/dzen_artistinfo.sh)^fg()  Umelec: ^fg($highlight)$artist^ca()";echo "^ca(1,$HOME/.scripts/dzen_albuminfo.sh)^fg()  Album:  ^fg($highlight)$album^ca()"; echo "^ca(1,$HOME/.scripts/dzen_lyrics.sh)  Rok:   ^fg($highlight)$date^ca()"; echo "  $percbar"; echo "      ^ca(1, mpc prev)  ^fg($white0)^i($HOME/.icons/prev.xbm) ^ca()  ^ca(1, mpc pause) ^i($HOME/.icons/pause.xbm) ^ca()  ^ca(1, mpc play) ^i($HOME/.icons/play.xbm) ^ca()   ^ca(1, mpc next) ^i($HOME/.icons/next.xbm) ^ca()"; echo " "; sleep 15) | dzen2 -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit' & sleep 15
killall feh
