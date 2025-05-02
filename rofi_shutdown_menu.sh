#!/usr/bin/env sh

MENU="Lock Screen|Restart|Power Off "
FONT_NAME="mono-space"
FONT_SIZE=18

DIALOG_RESULT=$(echo "$MENU" | rofi -sep "|" -dmenu -i -p "Shutdown Options" -tokenize -lines 3 -width 50 -padding 25 -disable-history -font "$FONT_NAME $FONT_SIZE")

echo "This result is : $DIALOG_RESULT"
sleep 1;
if [ "$DIALOG_RESULT" = "Lock Screen" ];
then
	exec swaylock -f -i /home/jack/Pictures/lockscreens/cyberpunk.png

elif [ "$DIALOG_RESULT" = "Power Off" ];
then
	exec poweroff

elif [ "$DIALOG_RESULT" = "Restart" ];
then
	exec reboot
fi
