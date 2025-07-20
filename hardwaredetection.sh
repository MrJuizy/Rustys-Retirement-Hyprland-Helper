#!/bin/bash

# Get monitor dimensions
monitor_height=$(hyprctl -j monitors | jq -r '.[0].height')
monitor_width=$(hyprctl -j monitors | jq -r '.[0].width')

# Get reserved space for each side (top, bottom, left, right)
export reserved_top=$(hyprctl -j monitors | jq -r '.[0].reserved[1]')
export reserved_bottom=$(hyprctl -j monitors | jq -r '.[0].reserved[3]')
export reserved_left=$(hyprctl -j monitors | jq -r '.[0].reserved[0]')
export reserved_right=$(hyprctl -j monitors | jq -r '.[0].reserved[2]')

# Calculate available desktop height and width
export desktop_height=$((monitor_height - reserved_top - reserved_bottom))
export desktop_width=$((monitor_width - reserved_left - reserved_right))