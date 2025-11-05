#!/bin/bash

STATE_FILE="$HOME/.config/krotate.rc"

# output display name
OUTPUT_DISP=$(kscreen-doctor -o | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g" | grep -oP '(?<=Output: 1 ).*(?=\s)')

# if empty file, create new
[[ ! -f "$STATE_FILE" ]] && echo "n" > "$STATE_FILE"

state=$(cat "$STATE_FILE")

if [[ "$state" == "n" ]]; then
	echo "l" > "$STATE_FILE"
	kscreen-doctor output."$OUTPUT_DISP".rotation.left
elif [[ "$state" == "l" ]]; then
	echo "i" > "$STATE_FILE"
        kscreen-doctor output."$OUTPUT_DISP".rotation.inverted
elif [[ "$state" == "i" ]]; then
	echo "r" > "$STATE_FILE"
        kscreen-doctor output."$OUTPUT_DISP".rotation.right
else
	echo "n" > "$STATE_FILE"
        kscreen-doctor output."$OUTPUT_DISP".rotation.normal
fi
