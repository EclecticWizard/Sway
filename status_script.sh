#!/bin/bash

while true; do
    media_status=$(playerctl metadata --format "{{ artist }} - {{ title }}" || echo "No media playing")
    current_time=$(date +"%Y-%m-%d %X")
    echo "$media_status | $current_time"
    sleep 1
done
