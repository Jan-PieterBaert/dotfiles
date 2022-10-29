#!/bin/bash

current_brightness=$(light -G)

case $BLOCK_BUTTON in
  4) changebacklight up ;;
  5) changebacklight down ;;
esac

echo "$current_brightness%"

# cat /sys/class/backlight/intel_backlight/actual_brightness | sed 's/^/100*/' | sed 's/$/\/937/' | bc | sed 's/$/%/'
