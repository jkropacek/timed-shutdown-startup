# Timed Shutdown - Startup


## Description
This script allows you to shutdown and startup the computer at a specific time. The script first announces the shutdown and startup via speech synthetizer, then calculates the time it should be put to sleep from input arguments, so that it can execute `rtcwake` command at a specific time. `rtcwake`'s argument specifies the startup time.

## Prerequisites
* speech synthesizer
  * By default, the script announces the input values via speech synthesizer. This is achieved by calling the `spd-say` command. To install it, run `sudo apt install speech-dispatcher` (or respective command, depending on your package manager). Alternatively, you may simply comment the line in the source code.
* rtcwake
  * The shutdown and startup are performed through the `rtcwake` command, which is part of `linux-utils-ng`, usually already preinstalled.
  * `rtcwake` requires **root priviledges**

## Usage
Run using `sh timed-shutdown-startup.sh [OPTION1] ... [OPTION2] ...`, where the `[OPTIONS]` are used to specify arguments, mainly the day and times at which the computer is supposed to shutdown and startup.

* use `sh timed-shutdown-startup.sh -h` to show general help
* use `sh timed-shutdown-startup.sh -d` to select day at which to shutdown the computer
  * default: `"tomorrow"`
  * for daily usage, the usual values will probably be `"now"`, `"today"` and `"tomorrow"`
* use `sh timed-shutdown-startup.sh -s` to select shutdown time
  * default: `"01:00"`
* use `sh timed-shutdown-startup.sh -b` to select startup time
  * default: `"09:00"`
For all accepted formats of `'-s'` and `'-b'` flags, see man pages of `'date -d'` and `'rtcwake --date'` respectively.

## Optional
You may have noticed that one line in the source code is commented (apart from the last three that serve the testing purpose). This is because my primary use of this script is more than just shutting down a computer. As I grew accustomed to falling asleep watching various videos (and waking up to them), I figured I might as well save some money on the electricity bill while I'm asleep.

The folder *optional* contains 4 small scripts which allow me to achieve this goal.
* *startup-vlc.sh* is a script which is part of my system's autostart utility, what it does is it remembers whether the computer was shutdown via conventional means or *timed-shutdown-startup.sh* (that's what the commented line is for).

Same goes for the *restore-variable.sh*, which changes the flag in *startup-vlc.sh* back to `false`, so that the video player is not started after a standard reboot.

The last two scripts, *shutdown-vlc.sh* and *vlc-restore.sh* are run remotely, the first one serves the purpose of starting the video player before sleep and lowering the blue gamma (to help fall asleep), while the second reverts the blue gamma back to normal, should the need arise.
