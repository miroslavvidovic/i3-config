#!/usr/bin/env bash

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep1; done

polybar bar1 &
polybar bar2 &

echo "Bars launched..."
