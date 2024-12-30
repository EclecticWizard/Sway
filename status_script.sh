#!/bin/bash

while true; do
    media_status=$(playerctl metadata --format "{{ artist }} - {{ title }}" || echo "No media playing")
    speaker_name="alsa_output.pci-0000_26_00.1.hdmi-stereo"
    volumeSpeakers=$(pactl get-sink-volume "$speaker_name" | awk -F '/' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//')
    current_time=$(date +"%Y-%m-%d %X")
    echo "$media_status | 🔊 $volumeSpeakers | $current_time"
    sleep 0.1
done
