#!/usr/bin/env sh

# Terminate already running bar instances
killall -9 -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar > /dev/null; do sleep 1; done

polybar top &
polybar external &

