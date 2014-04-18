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

. /etc/profile.d/infinality-settings.sh

if [[ -z $CHECKUPDATES_DB ]]; then
        export CHECKUPDATES_DB="/var/tmp/checkup-db-${USER}/"
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

/usr/lib/lxpolkit/lxpolkit &
thunar --daemon &

#/usr/bin/start-pulseaudio-x11
#volumeicon &

urxvtd -q -f -o

# Must be the last with an exec
# because exec makes the proccess take control
# over the xinit
# If not, the script will exit, and Xorg too
exec i3
