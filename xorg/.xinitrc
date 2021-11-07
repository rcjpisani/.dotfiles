#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

nvidia-settings -l &
#feh --bg-scale '/home/robert/Pictures/squareTrioGray.png'
#feh --bg-center --no-xinerama ~/Pictures/portal.jpg
#xbacklight -set 7 &
#xbindkeys &
#conky | while read -r; do xsetroot -name "$REPLY"; done &
#xrandr --output DVI-I-2 --mode 1920x1080 --rate 144.0 &

#exec dwm
#exec openbox-session
#exec gnome-session
exec cinnamon-session
#exec startkde
# exec startxfce4
