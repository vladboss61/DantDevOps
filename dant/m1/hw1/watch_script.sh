#!bin/bash

WATCH_DIR=~/watch

inotifywait -m -e create --format '$f' "$WATCH_DIR" |
while read FILE
do
	echo "New file detected: $FILE"
	cat "$WATCH_DIR/$FILE"
	mv "$WATCH_DIR/$FILE" "$WATCH_DIR/{$FILE}.back"
	echo "File moved to ${FILE}.back"
done
