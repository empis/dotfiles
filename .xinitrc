xrdb ~/.Xresources 
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local 
xset fp rehash
xset b off 
wmname LG3D
xcalib $HOME/.x230.icm &
xsetroot -cursor_name left_ptr &
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
hsetroot -fill $HOME/Obrázky/wallpaper.jpg &
unclutter -grab -noevents -root &
urxvtd &

if [[ -z `xrandr | grep " connected" | grep 'VGA'` ]]; then
	echo "No monitor found" &
else
	xrandr --output VGA1 --auto --above LVDS1 &
fi

if [[ "`acpi -b | awk '{gsub(/,/,""); print $3}'`" != "Discharging" ]]; then
	compton &
fi

exec $HOME/.scripts/bspwm-launch
