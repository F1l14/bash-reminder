#!/bin/bash

# Ensure correct usage
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 [time] - [message]"
    echo "Example: $0 today 5 pm - 'Go to the gym!'"
    exit 1
fi

# Join all arguments into a single string
ARGS="$*"

# Separate time and message using ' - '
TIME_PART=$(echo "$ARGS" | awk -F ' - ' '{print $1}')
MESSAGE=$(echo "$ARGS" | awk -F ' - ' '{print $2}')

if [ -z "$MESSAGE" ]; then
    MESSAGE="Reminder!"
fi

# --- CLEAN UP THE TIME STRING FOR 'AT' ---
# 1. Strip out the word "today" (case-insensitive) if the user typed it
TIME_PART=$(echo "$TIME_PART" | sed -E 's/\btoday\b//Ig')

# 2. Use the 'date' command to standardize the time into a format 'at' understands
# This converts "5pm", "5 pm", or "17:00" all into standard 24-hour time.
CLEAN_TIME=$(date -d "$TIME_PART" +"%H:%M" 2>/dev/null)

# If 'date' failed (e.g. user used "now + 5 minutes"), fall back to the original string
if [ -z "$CLEAN_TIME" ]; then
    CLEAN_TIME="$TIME_PART"
fi
# ----------------------------------------

# Schedule the notification with GUI environment variables
echo "env DISPLAY=$DISPLAY DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS notify-send -u critical 'Reminder' '$MESSAGE'" | at $CLEAN_TIME 2>/dev/null

# Check if it worked
if [ $? -eq 0 ]; then
    echo "🔔 Reminder set for: $CLEAN_TIME -> $MESSAGE"
else
    echo "❌ Error: 'at' still rejected '$CLEAN_TIME'."
    echo "Try a direct relative time like: 'now + 5 minutes'"
fi