#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function isodate {
  echo $(date --iso-8601=seconds)
}

xset m 0 0

mouse_id=$1
speed=$2

echo "$(isodate) mouse_id: $mouse_id" 2>&1 | tee -a "$DIR/mouse.log"
echo "$(isodate) speed: $speed" 2>&1 | tee -a "$DIR/mouse.log"

xinput set-prop $mouse_id "Coordinate Transformation Matrix" $speed, 0, 0, 0, $speed, 0, 0, 0, 1

echo $(isodate) $(xset q | grep -A 1 Pointer) 2>&1 | tee -a "$DIR/mouse.log"
echo $(isodate) $(xinput list-props 10 | grep "Coordinate Transformation Matrix") 2>&1 | tee -a "$DIR/mouse.log"

# https://askubuntu.com/questions/773171/im-missing-mouse-pointer-speed-option-in-ubuntu-16-04/942445#942445
# https://www.reddit.com/r/linux_gaming/comments/1ew39a/mouse_sensitivity_and_linux_gaming/
