# Timed Shutdown - Startup

This script allows you to shutdown and startup the computer at a specific time.

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
