#!/bin/sh
# DWM
#BATT=$(acpi -b | awk '{ print "[" $3" | "$4"]" }' | tr -d ',' )
DATE=$(date +"[%d|%b] [%a] [%H:%M:%S]")
#IP=$(hostname -i | awk '{print $1}')
DWMST_PATH="~/.config/dwm-status-go"
while true
do
    xsetroot -name "IP:$(hostname -i | awk '{print $1}') :: Bat:$(acpi -b | awk '{ print $3" | "$4 }' | tr -d ',' ) :: Date:$(date +"[%d %b] :: %a :: [%H:%M:%S]")"
    sleep 1s
done &
#if (xrandr | grep "HDMI1 connected" > /dev/null)
#then
# xrandr --output eDP1 --off &
# xrandr --output HDMI1 --mode 1360x768
#fi
feh --bg-scale ~/.config/bg.jpg &
#twmnd &
xfce4-notifyd &
xrdb -merge ~/.Xresources &
wmname LG3D &
telegram-desktop &
slack &
blueman-applet &	# BlueTooth
spotify &
thunderbird &
#gpmdp &		# Google Music
exec dwm
