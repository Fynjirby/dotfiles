#!/bin/bash

zenity --question \
  --title="" \
  --window-icon=system-shutdown \
  --text="<b>Bro do you really wanna shutdown $(uname -n)?</b>" \
  --ok-label="Yes" \
  --cancel-label="No" \
  --default-cancel \
  --no-wrap 
if [ $? -eq 0 ]; then
    systemctl poweroff
fi
