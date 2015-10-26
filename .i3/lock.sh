#!/bin/sh -e

xset dpms force off

# Take a screenshot
scrot /tmp/screen_locked.png

# Pixellate it 10x
#mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 0x12 /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png
xset dpms force off

# Turn the screen off after a delay.
sleep 15; pgrep i3lock && xset dpms force off
