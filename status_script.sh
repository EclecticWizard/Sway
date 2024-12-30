#!/bin/bash

while true; do
    media_status=$(playerctl metadata --format "{{ artist }} - {{ title }}" || echo "No media playing")
    speaker_id="61"
    volumeSpeakers=$(pactl get-sink-volume "$speaker_id" | awk -F '/' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//')
    current_time=$(date +"%Y-%m-%d %X")
    echo "$media_status | 🔊 $volumeSpeakers | $current_time"
    sleep 0.1
done
