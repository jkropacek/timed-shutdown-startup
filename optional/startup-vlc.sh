#!/bin/bash
RunAtStartUp=false
if [ "$RunAtStartUp" == true ];
	then
		sleep 30;
		vlc -fZ $HOME/timed-shutdown-startup/playlist.xspf & disown;
fi
