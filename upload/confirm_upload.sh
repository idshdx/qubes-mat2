#!/bin/bash
set -euo pipefail

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File not found!"
    exit 1
fi

# Ask user with zenity
ANSWER=$(zenity --question \
    --title="Confirm Upload" \
    --text="Do you really want to upload this file anonymously?" \
    --ok-label="Upload" \
    --cancel-label="Cancel" \
    && echo yes || echo no)

if [[ "$ANSWER" == "yes" ]]; then
    torsocks curl -F "file=@${FILE}" "https://filebin.net"
    notify-send "Upload" "File uploaded anonymously."
else
    notify-send "Upload Cancelled" "File was not uploaded."
fi
