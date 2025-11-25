#!/bin/bash

STATUS=$(sudo vpn status 2>/dev/null)

if echo "$STATUS" | grep -q "Connected"; then
    ICON=""     # locked
    echo "{\"text\": \"$ICON\", \"class\": \"connected\"}"
    exit 0
else
    ICON=""     # unlocked
    echo "{\"text\": \"$ICON\", \"class\": \"disconnected\"}"
    exit 1
fi
