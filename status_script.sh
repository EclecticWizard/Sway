#!/bin/bash

while true; do
    media_status=$(playerctl metadata --format "{{ artist }} - {{title }}" || echo "No media playing")
    active_sink=$(pactl list short sinks | grep RUNNING | cut -f1)
        # If no running sink is found, fallback to the default
    if [ -z "$active_sink" ]; then
        active_sink=$(pactl info | grep 'Default Sink' | cut -d: -f2 | xargs)
    fi

        # Get the description of the active sink
    sink_description=$(pactl list sinks | awk -v sink="$active_sink" '
         /^Sink #/ {is_target = $2 == "#"sink}
         /Description:/ && is_target {gsub(/^.*Description: /, ""); print; exit}
    ')
    pactl set-default-sink $active_sink

    current_time=$(date +"%Y-%m-%d %X")
    volumeSpeakers=$(pactl get-sink-volume "$active_sink" | awk -F '/' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//')

    echo "$media_status | 🔊 $volumeSpeakers $sink_description | $current_time"
    sleep 0.1
done
