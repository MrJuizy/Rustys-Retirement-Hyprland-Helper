#!/bin/bash

if ! command -v gamescope &>/dev/null; then
    echo "gamescope is not installed"
    echo "Please install gamescope to use this script"
    exit 1
fi
if ! command -v jq &>/dev/null; then
    echo "jq is not installed"
    echo "Please install jq to use this script"
    exit 1
fi  

# Source for Variables
source "$(dirname "$0")/hardwaredetection.sh"
source "$(dirname "$0")/templates.sh"

read -p "WARNING! This script appends window rules to your userperfs.conf! Type 'I understand' to continue:" confirm
while [[ "$confirm" != "I understand'" ]]; do
    read -p "Type 'I understand' to continue:" confirm
done

while true
do
    PS3="Select an orientation: "
    game_orientation=(
        "Horizontal"
        "Vertical"
        "Quit"
    )
    select opt in "${game_orientation[@]}"
    do
        case $opt in
            "Horizontal")
                reserved=296
                echo "$opt it is. Classic!"
                PS3="Select your preferred Location: "
                scr_locationTB=(
                    "Top"
                    "Bottom"
                    "Back"
                )
                select subopttb in "${scr_locationTB[@]}"
                do
                    case $subopttb in
                        "Top")
                            echo "$subopttb - You maniac!"
                            generate_reservespace_sh "$subopttb" "$reserved" > reservespace.sh
                            chmod +x reservespace.sh
                            generate_userprefs_conf "$desktop_width" "$reserved" "$reserved_left " "$reserved_top" >> ~/.config/hypr/userprefs.conf
                            echo -e "\n--- Launch Options ---"
                            echo "$(generate_launch_options "$desktop_width" "$reserved")"
                            echo -e "---------------------\n"
                            echo -e "You can copy from terminal with Ctrl+Shift+C"
                            echo -e "---------------------\n"
                            read -p "Add the Launch Options to the Game! Type 'launch options set' to continue: " confirm
                            while [[ "$confirm" != "launch options set" ]]; do
                                read -p "Type 'launch options set' to continue: " confirm
                            done
                            read -p "Copy the reservespace.sh to the Game's root folder. Type 'done' to complete the setup:" confirm
                            while [[ "$confirm" != "done" ]]; do
                                read -p "Type 'done' to complete the setup: " confirm
                            done
                            break 3
                            ;;
                        "Bottom")
                            echo "$subopttb - Another classic!"
                            generate_reservespace_sh "$subopttb" "$reserved" > reservespace.sh
                            chmod +x reservespace.sh
                            generate_userprefs_conf "$desktop_width" "$reserved" "$reserved_left" "$(desktop_height - $reserved)" >> ~/.config/hypr/userprefs.conf
                            echo -e "\n--- Launch Options ---"
                            echo "$(generate_launch_options "$desktop_width" "$reserved")"
                            echo -e "---------------------\n"
                            echo -e "You can copy from terminal with Ctrl+Shift+C"
                            echo -e "---------------------\n"
                            read -p "Add the Launch Options to the Game! Type 'launch options set' to continue: " confirm
                            while [[ "$confirm" != "launch options set" ]]; do
                                read -p "Type 'launch options set' to continue: " confirm
                            done
                            read -p "Copy the reservespace.sh to the Game's root folder. Type 'done' to complete the setup:" confirm
                            while [[ "$confirm" != "done" ]]; do
                                read -p "Type 'done' to complete the setup: " confirm
                            done
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
                reserved=500
                echo "$opt - Alright, an efficient one!"
                PS3="Select the preferred Side of your Monitor: "    
                scr_locationLR=(
                    "Left"
                    "Right"
                    "Back"
                )
                select suboptlr in "${scr_locationLR[@]}"
                do
                    case $suboptlr  in
                        "Left")
                            echo "$suboptlr it is."
                            generate_reservespace_sh "$suboptlr" "$reserved" > reservespace.sh
                            chmod +x reservespace.sh
                            generate_userprefs_conf "$reserved" "$desktop_height" "$reserved_left" "$reserved_top" >> ~/.config/hypr/userprefs.conf
                            echo -e "\n--- Launch Options ---"
                            echo "$(generate_launch_options "$reserved" "$desktop_height")"
                            echo -e "---------------------\n"
                            echo -e "You can copy from terminal with Ctrl+Shift+C"
                            echo -e "---------------------\n"
                            read -p "Add the Launch Options to the Game! Type 'launch options set' to continue: " confirm
                            while [[ "$confirm" != "launch options set" ]]; do
                                read -p "Type 'launch options set' to continue: " confirm
                            done
                            read -p "Copy the reservespace.sh to the Game's root folder. Type 'done' to complete the setup:" confirm
                            while [[ "$confirm" != "done" ]]; do
                                read -p "Type 'done' to complete the setup: " confirm
                            done
                            break 3
                            ;;
                        "Right")
                            echo "$suboptlr it is."
                            generate_reservespace_sh "$suboptlr" "$reserved" > reservespace.sh
                            chmod +x reservespace.sh
                            generate_userprefs_conf "$reserved" "$desktop_height" "$($desktop_width - $reserved)" "$reserved_top" >> ~/.config/hypr/userprefs.conf
                            echo -e "\n--- Launch Options ---"
                            echo "$(generate_launch_options "$reserved" "$desktop_height")"
                            echo -e "---------------------\n"
                            echo -e "You can copy from terminal with Ctrl+Shift+C"
                            echo -e "---------------------\n"
                            read -p "Add the Launch Options to the Game! Type 'launch options set' to continue: " confirm
                            while [[ "$confirm" != "launch options set" ]]; do
                                read -p "Type 'launch options set' to continue: " confirm
                            done
                            read -p "Copy the reservespace.sh to the Game's root folder. Type 'done' to complete the setup:" confirm
                            while [[ "$confirm" != "done" ]]; do
                                read -p "Type 'done' to complete the setup: " confirm
                            done
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