#!/bin/sh
getSong() {
	pid=$(pgrep -f "/snap/spotify/.+/usr/share/spotify/spotify$")
	if [ -z "$pid" ]
	then
		echo "Current song: Not playing"
	else
		windowId=$(wmctrl -lp | grep $pid | awk '{print $1}')
		songName=$(xdotool getwindowname $windowId)
		if [ "$songName" == "Spotify Premium" ]; then
			songName="Not playing"
		fi
		echo "Current song: $songName"
	fi
}

getSong 


