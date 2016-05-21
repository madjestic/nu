#!/bin/sh
#
# Start Xmonad

[[ -f /home/madjestic/.Xresources ]] && xrdb -merge /home/madjestic/.Xresources

feh --bg-scale 1600x900 /home/madjestic/Documents/pics/neutrino3.jpg &
xcompmgr -cCfF -r7 -o.65 -l-10 -t-8 -D7 &
xsetroot -cursor_name left_ptr
urxvtd --quiet --opendisplay --fork
export ALTERNATE_EDITOR=""
export EDITOR=emacsclient
emacs --daemon
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad

# Start Openbox
# exec ck-launch-session dbus-launch --sh-syntax --exit-with-session openbox-session
