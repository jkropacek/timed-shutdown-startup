#!/bin/bash

xrandr --output DVI-1 --brightness 0.3                     # sets monitor brightness to 0.3 to help fall asleep
xgamma -bgamma 0.3                                          # sets blue gamma to 0.3 to help fall asleep

vlc -fZ $HOME/admin/playlist.xspf & disown  # starts daily ritual 
