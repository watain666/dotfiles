#!/bin/bash
new_cover1="https://i.scdn.co/image/"
new_cover2=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "artUrl"|cut -b 44-|cut -d '"' -f 1|cut -d '/' -f 5|egrep -v ^$)
imgurl=$new_cover1$new_cover2
echo $imgurl