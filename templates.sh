#!/bin/bash

#Templates for generating configuration files and scripts for Rusty's Retirement game overlay with reserved screenspace.
# Function to generate reservespace.sh content
# Arguments: $1 = location (top/bottom/left/right), $2 = value for chosen location
function generate_reservespace_sh() {
    local location="$1"
    local value="$2"
    local reserver=""
    case "$location" in
        top)
            reserver="$value,0,0,0"
            ;;
        bottom)
            reserver="0,$value,0,0"
            ;;
        left)
            reserver="0,0,$value,0"
            ;;
        right)
            reserver="0,0,0,$value"
            ;;
    esac
    cat <<EOF
#!/bin/bash
while getopts "rq" opt; do
case $opt in
r) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,${reserver};;
q) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,0,0,0;;
\?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
esac
done
EOF
}

# Function to generate userprefs.conf block
# Arguments: $1 = width, $2 = height, $3 = move_x, $4 = move_y
function generate_userprefs_conf() {
    local width="$1"
    local height="$2"
    local move_x="$3"
    local move_y="$4"
    cat <<EOF
# Rusty Retirement Game Overlay
windowrulev2 = tag +rtr, title:(Rusty's Retirement)
windowrulev2 = float, tag:rtr
windowrulev2 = pin, tag:rtr
windowrulev2 = size ${width} ${height}, tag:rtr
windowrulev2 = move ${move_x} ${move_y}, tag:rtr
windowrulev2 = noblur, tag:rtr
windowrulev2 = noshadow, tag:rtr
windowrulev2 = noborder, tag:rtr
windowrulev2 = opacity 1.0 override, tag:rtr
windowrulev2 = norounding, tag:rtr
EOF
}



# Function to generate launch options for the game
# Usage: generate_shortcut <width> <height>
function generate_launch_options() {
    local width="$1"
    local height="$2"
    echo "reservespace.sh -r ; gamescope -w $width -h $height -W $width -H $height -b --backend sdl -- %command% ; reservespace.sh -q"
}
