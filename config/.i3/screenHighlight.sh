#!/bin/sh

if [ $1 = "inc" ]; then
	xbacklight -inc 10
else
	xbacklight -dec 10
fi

notify-send "Screen backlight" "$(python -c "print (int($(xbacklight)))")"

