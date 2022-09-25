#!/bin/bash

# Battery Command
#
# Quick and dirty way to show battery percentage
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Battery
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🔋
# @raycast.packageName Custom scripts

ioreg -r -d 1 -k BatteryPercent | \
egrep '("BatteryPercent"|"Product")' | \
sed \
-e 'N;s/"\n//g' \
-e 's/"Product" = "//g' \
-e 's/"BatteryPercent" =/ ->/g' \
-e 's/  //g'
