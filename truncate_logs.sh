#!/bin/bash

largest_log=$(find ./Level_1/catalina.2023-05-18.log -name "*.log" -exec du -a {} + | sort -n -r | head -n 1 | awk '{print $2}')

if [ -f "$largest_log" ]; then
    tail -n 100 "$largest_log" > "$largest_log.tmp"
    mv "$largest_log.tmp" "$largest_log"
    echo "Log file truncated to 100 lines."
else
    echo "No log files found."
fi
