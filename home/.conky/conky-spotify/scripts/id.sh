#!/bin/bash

id=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "artUrl"|cut -b 44-|cut -d '"' -f 1|cut -d '/' -f 5|egrep -v ^$`
echo $id