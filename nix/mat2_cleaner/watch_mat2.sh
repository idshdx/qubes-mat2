#!/bin/bash
set -euo pipefail

WATCH_DIR=~/QubesIncoming/proxy-cleaner
CLEAN_DIR=~/Cleaned

mkdir -p "$CLEAN_DIR"

inotifywait -m -e close_write --format "%f" "$WATCH_DIR" | while read -r FILE; do
    EXT="${FILE##*.}"
    if [[ "$EXT" =~ ^(jpg|jpeg|png|gif|bmp|tiff)$ ]]; then
        echo "Cleaning $FILE..."
        mat2 --inplace "$WATCH_DIR/$FILE"
        mv "$WATCH_DIR/$FILE" "$CLEAN_DIR/"
        qvm-move-to-vm work-vault "$CLEAN_DIR/$FILE"
        echo "File cleaned and moved."
    fi
done
