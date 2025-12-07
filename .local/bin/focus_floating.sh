#!/usr/bin/env bash
# Toggle focus between floating and tiled windows on the same workspace.

active=$(hyprctl activewindow -j)
ws=$(echo "$active" | jq '.workspace.id')

is_floating=$(echo "$active" | jq '.floating')

clients=$(hyprctl clients -j | jq --argjson ws "$ws" '.[] | select(.workspace.id == $ws)')

if [ "$is_floating" = "true" ]; then
    target=$(echo "$clients" | jq -r 'select(.floating == false) | .address' | head -n1)
else
    target=$(echo "$clients" | jq -r 'select(.floating == true) | .address' | head -n1)
fi

[ -n "$target" ] && hyprctl dispatch focuswindow "address:$target"
