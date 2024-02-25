#!/bin/bash

# Configuration
THRESHOLD_PERCENT=90  # Change this to the desired threshold percentage
LOG_FILE="/var/log/disk.log"

# Check disk utilization
CURRENT_PERCENT=$(df / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

# Compare with threshold
if [ "$CURRENT_PERCENT" -gt "$THRESHOLD_PERCENT" ]; then
    # Write warning message to log file
    echo "$(date +"%Y-%m-%d %T"): WARNING - Disk utilization is above $THRESHOLD_PERCENT%" >> "$LOG_FILE"
fi
