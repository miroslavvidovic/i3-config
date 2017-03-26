#!/usr/bin/env bash
#
# display wifi signal strength in conky on manjaro 

IFACE="wlp8s0"
USE_PERCENT=1

IW=$(which iwlist || echo "/sbin/iwlist")

if [[ ! -x $IW ]]; then
  echo "No iw binary was found on the system." 1>2
  exit 1
fi

dbm="$($IW $IFACE scan | grep Quality | cut -d'=' -f2 | cut -d' ' -f1 | cut -d'/' -f1)"
[[ -n "$dbm" ]] || exit 1

# This is for cuting out some weird output numbers 
# because dbm is sometimes 70 13 13 and we need just the first number
dbm="$(echo $dbm | cut -d' ' -f1)"

quality=$(($dbm * 100 / 70)) 

echo "$quality" 
