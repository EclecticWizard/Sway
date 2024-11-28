#!/bin/bash

while true; do
    media_status=$(playerctl metadata --format "{{ artist }} - {{ title }}" || echo "No media playing")
    volume=$(pactl list sinks | grep 'Volume:' | awk -F '/' '{print $2}' | head -n 1 | sed 's/^[ \t]*//;s/[ \t]*$//')
    current_time=$(date +"%Y-%m-%d %X")
    echo "$media_status | 🔊 $volume | $current_time"
    sleep 0.1
done
