#!/bin/bash

zenity --question \
  --title="" \
  --window-icon=system-shutdown \
  --text="<b>Bro do you really wanna suspend $(uname -n)?</b>" \
  --ok-label="Yes" \
  --cancel-label="No" \
  --no-wrap 
if [ $? -eq 0 ]; then
    systemctl suspend
fi
