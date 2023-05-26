#!/bin/bash

if synclient -l | grep "TouchpadOff .*=.*0" ; then
	synclient TouchpadOff=1 ;
	notify-send "Touchpad disabled.";
else
	synclient TouchpadOff=0 ;
	notify-send "Touchpad enabled.";
fi
