#!/bin/bash

if ! command -v gamescope &>/dev/null; then
    echo "gamescope is not installed"
    echo "Please install gamescope to use this script"
    exit 1
fi
while true
do
    PS3="Select an orientation: "
    options=(
        "Horizontal"
        "Vertical"
        "Quit"
    )
    #TODO Check if you can use  txt file from folder to slim down echo for  reservespace.sh and that append for userprefs.conf
    select opt in "${options[@]}"
    do
        case $opt in
            "Horizontal")
                echo "$opt it is. Classic!"
                PS3="Select your preferred Location: "
                options2=(
                    "Top"
                    "Bottom"
                    "Back"
                )
                select subopttb in "${options2[@]}"
                do
                    case $subopttb in
                        "Top")
                            echo "$subopttb - You maniac!"
                            echo '#!/bin/bash
while getopts "rq" opt; do
case $opt in
r) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,296,0,0,0;;
q) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,0,0,0;;
\?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
esac
done' > ~/.steam/steam/steamapps/common/Rusty's Retirement/reservespace.sh
                            echo "# Rusty Retirement Game Overlay
windowrulev2 = tag +rtr, title:(Rusty's Retirement)
windowrulev2 = float, tag:rtr

# Remove this if you don't want rtr to appear in all workspaces
windowrulev2 = pin, tag:rtr
# Sizing of window
windowrulev2 = size 100% 296, tag:rtr

# Move rtr to top of the screen
windowrulev2 = move 0 42, tag:rtr

# Visibility rules
windowrulev2 = noblur, tag:rtr
windowrulev2 = noshadow, tag:rtr
windowrulev2 = noborder, tag:rtr
windowrulev2 = opacity 1.0 override, tag:rtr
windowrulev2 = norounding, tag:rtr" >> ~/.config/hypr/userprefs.conf
                            break 3
                            ;;
                        "Bottom")
                            echo "$subopttb - Another classic!"
                            echo '#!/bin/bash
while getopts "rq" opt; do
case $opt in
r) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,296,0,0;;
q) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,0,0,0;;
\?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
esac
done' > ~/.steam/steam/steamapps/common/Rusty's Retirement/reservespace.sh
                            echo "# Rusty Retirement Game Overlay
windowrulev2 = tag +rtr, title:(Rusty's Retirement)
windowrulev2 = float, tag:rtr

# Remove this if you don't want rtr to appear in all workspaces
windowrulev2 = pin, tag:rtr
# Sizing of window
windowrulev2 = size 100% 296, tag:rtr

# Move rtr to top of the screen
windowrulev2 = move 0 100%-296, tag:rtr

# Visibility rules
windowrulev2 = noblur, tag:rtr
windowrulev2 = noshadow, tag:rtr
windowrulev2 = noborder, tag:rtr
windowrulev2 = opacity 1.0 override, tag:rtr
windowrulev2 = norounding, tag:rtr" >> ~/.config/hypr/userprefs.conf
                            break 3
                            ;;
                        "Back")
                            break 2
                            ;;
                        *)
                            echo "Invalid option $REPLY"
                            ;;
                    esac
                    REPLY=
                done
                ;;
            "Vertical")
                echo "$opt - Alright, an efficient one!"
                PS3="Select the preferred Side of your Monitor: "    
                options3=(
                    "Left"
                    "Right"
                    "Back"
                )
                select suboptlr in "${options3[@]}"
                do
                    case $suboptlr  in
                        "Left")
                            echo "$suboptlr it is."
                            echo '#!/bin/bash
while getopts "rq" opt; do
case $opt in
r) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,0,500,0;;
q) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,0,0,0;;
\?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
esac
done' > ~/.steam/steam/steamapps/common/Rusty's Retirement/reservespace.sh
                            echo "# Rusty Retirement Game Overlay
windowrulev2 = tag +rtr, title:(Rusty's Retirement)
windowrulev2 = float, tag:rtr

# Remove this if you don't want rtr to appear in all workspaces
windowrulev2 = pin, tag:rtr
# Sizing of window
#TODO Check if its possible to pass a variable at XX
windowrulev2 = size 500 XX, tag:rtr

# Move rtr to top of the screen
windowrulev2 = move 100%-500 42, tag:rtr

# Visibility rules
windowrulev2 = noblur, tag:rtr
windowrulev2 = noshadow, tag:rtr
windowrulev2 = noborder, tag:rtr
windowrulev2 = opacity 1.0 override, tag:rtr
windowrulev2 = norounding, tag:rtr" >> ~/.config/hypr/userprefs.conf
                            break 3
                            ;;
                        "Right")
                            echo "$suboptlr it is."
                            echo '#!/bin/bash
while getopts "rq" opt; do
case $opt in
r) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,0,0,500;;
q) hyprctl keyword monitor $(hyprctl -j monitors | jq -r '.[].name'),addreserved,0,0,0,0;;
\?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
esac
done' > ~/.steam/steam/steamapps/common/Rusty's Retirement/reservespace.sh
                            echo "# Rusty Retirement Game Overlay
windowrulev2 = tag +rtr, title:(Rusty's Retirement)
windowrulev2 = float, tag:rtr

# Remove this if you don't want rtr to appear in all workspaces
windowrulev2 = pin, tag:rtr
# Sizing of window
#TODO Check if its possible to pass a variable at XX
windowrulev2 = size 500 XX, tag:rtr

# Move rtr to top of the screen
windowrulev2 = move 0 42, tag:rtr

# Visibility rules
windowrulev2 = noblur, tag:rtr
windowrulev2 = noshadow, tag:rtr
windowrulev2 = noborder, tag:rtr
windowrulev2 = opacity 1.0 override, tag:rtr
windowrulev2 = norounding, tag:rtr" >> ~/.config/hypr/userprefs.conf
                            break 3
                            ;;
                        "Back")
                            break 2
                            ;;
                        *)
                            echo "Invalid option $REPLY"
                            ;;
                    esac
                    REPLY=
                done
                ;;
            "Quit")
                break 2
                ;;
            *)
                echo "Invalid option $REPLY"
                ;;
        esac
        REPLY=
    done
done