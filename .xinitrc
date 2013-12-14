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

feh --bg-scale ~/Pictures/spiral.jpg &
xbacklight -set 7 &
conky | while read -r; do xsetroot -name "$REPLY"; done &
xbindkeys &

# exec dwm
exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
