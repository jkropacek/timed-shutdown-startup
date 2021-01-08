#!/bin/bash

# setting default variables
day="tomorrow"
shut_down="01:00"
start_time="09:00"

print_usage()
{
	echo ""
	echo "Usage: sh timed-shutdown-startup.sh [OPTION1] ... [OPTION2] ..."
	echo ""
	echo "Available OPTIONs:"
	echo "-h	show this help"
	echo "-d	select shutdown day					default:	'$day'"
	echo "-s	set shutdown time for -d being today or tomorrow	default:	'$shut_down'"
	echo "-b	set boot time						default:	'$start_time'"
	echo ""
	echo "Usual values of '-d' flag are 'now', 'today' and 'tomorrow'"
	echo "For all accepted formats of '-s' and '-b' flags, see man pages of 'date -d' and 'rtcwake --date', respectively."
	echo ""
}

while getopts 'd:s:b:h' flag; do
	case "$flag" in
		d) day="${OPTARG}" ;;
		s) shut_down="${OPTARG}" ;;
		b) start_time="${OPTARG}" ;;
		h) print_usage
		   exit 0 ;;
	esac
done

spd-say -r -50 -p -100 -i -50 -w "The shutdown time has been set to $day at $shut_down, computer will boot up again at $start_time"	# speech synthesizer will verify the settings

current_time=$(date +%s)                                                                                # outputs current time in seconds
target_time=$(date -d "$day $shut_down" +%s)                                                            # gets the shutdown time in seconds
sleep_time=$(( "$target_time" - "$current_time" ))                                                      # calculates necessary sleep time
sleep "$sleep_time"                                                                                     # puts the script to sleep for necessary time
# sed -i -e 's/RunAtStartUp=false/RunAtStartUp=true/g' $HOME/timed-shutdown-startup/startup-vlc.sh      # OPTIONAL: sets RunAtStartUp variable to true, making the VLC to start playing at startup
sudo rtcwake -m off --date "$start_time"                                                                # shuts down the PC and sets the boot time

# echo "Target shutdown time is $target_time, which corresponds to $day $shut_down"
# echo "Sleep time has been set to $sleep_time seconds."
# echo "Boot time has been set to $start_time"
