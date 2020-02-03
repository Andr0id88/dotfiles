#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
setxkbmap no
exec i3

exec startsync
