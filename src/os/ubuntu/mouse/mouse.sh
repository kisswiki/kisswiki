#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function isodate {
  echo $(date --iso-8601=seconds)
}

xset m 0 0

DEVICE="$1"
devlist=$(xinput --list | grep "$DEVICE" | sed -n 's/.*id=\([0-9]\+\).*/\1/p')
speed=$2

echo "$(isodate) speed: $speed" 2>&1 | tee -a "$DIR/mouse.log"

for dev in $devlist
do
  echo "$(isodate) dev: $dev" 2>&1 | tee -a "$DIR/mouse.log"
  xinput set-prop $dev "Coordinate Transformation Matrix" $speed, 0, 0, 0, $speed, 0, 0, 0, 1
done


echo $(isodate) $(xset q | grep -A 1 Pointer) 2>&1 | tee -a "$DIR/mouse.log"
echo $(isodate) $(xinput list-props 10 | grep "Coordinate Transformation Matrix") 2>&1 | tee -a "$DIR/mouse.log"

# https://askubuntu.com/questions/773171/im-missing-mouse-pointer-speed-option-in-ubuntu-16-04/942445#942445
# https://www.reddit.com/r/linux_gaming/comments/1ew39a/mouse_sensitivity_and_linux_gaming/
