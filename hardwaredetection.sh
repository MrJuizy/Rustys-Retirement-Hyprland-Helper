#!/bin/bash

# Get monitor dimensions
monitor_height=$(hyprctl -j monitors | jq -r '.[0].height')
monitor_width=$(hyprctl -j monitors | jq -r '.[0].width')

# Get reserved space for each side (top, bottom, left, right)
reserved_top=$(hyprctl -j monitors | jq -r '.[0].reserved[0]')
reserved_bottom=$(hyprctl -j monitors | jq -r '.[0].reserved[1]')
reserved_left=$(hyprctl -j monitors | jq -r '.[0].reserved[2]')
reserved_right=$(hyprctl -j monitors | jq -r '.[0].reserved[3]')

# Export reserved values for use in install.sh
export reserved_top
export reserved_bottom
export reserved_left
export reserved_right

# Calculate available desktop height and width
export desktop_height=$((monitor_height - reserved_top - reserved_bottom))
export desktop_width=$((monitor_width - reserved_left - reserved_right))