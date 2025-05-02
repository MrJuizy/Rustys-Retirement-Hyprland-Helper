#!/bin/bash
while getopts "rq" opt; do
  case $opt in
    r) hyprctl keyword monitor DP-1,addreserved,0,338,0,0;;
    q) hyprctl keyword monitor DP-1,addreserved,0,0,0,0;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
  esac
done