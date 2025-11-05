#!/bin/bash

STATE_F="$HOME/.config/krotate.rc"


[[ ! -f "$STATE_F" ]] && echo "n" > "$STATE_F"

state=$(cat "$STATE_F")
OUTPUT_DISP=$(kscreen-doctor -o | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g" | grep -oP '(?<=Output: 1 ).*(?=\s)')

if [[ "$state" == "n" ]]; then
	echo "r" > "$STATE_F"
	kscreen-doctor output."$OUTPUT_DISP".rotation.right
elif [[ "$state" == "r" ]]; then
	echo "i" > "$STATE_F"
        kscreen-doctor output."$OUTPUT_DISP".rotation.inverted
elif [[ "$state" == "i" ]]; then
	echo "l" > "$STATE_F"
        kscreen-doctor output."$OUTPUT_DISP".rotation.left
else
	echo "n" > "$STATE_F"
        kscreen-doctor output."$OUTPUT_DISP".rotation.normal
fi
