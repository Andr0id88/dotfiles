#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
setxkbmap no
eval $(ssh-agent)
exec i3
