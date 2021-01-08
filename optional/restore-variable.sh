#!/bin/bash

sleep 120;
sed -i -e 's/RunAtStartUp=true/RunAtStartUp=false/g' $HOME/timed-shutdown-startup/startup-vlc.sh
