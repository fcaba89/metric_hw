#!/bin/bash

log() {
  echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" >> metric_hw.txt
}

check_cpu() {
  cpu_threshold=90
  cpu_usage=$(top -l 1 | awk '/CPU usage:/ {print int($3)}')

  if [ "$cpu_usage" -gt "$cpu_threshold" ]; then
    log "High CPU usage: $cpu_usage%"
elisf [ "$cpu_usage" =0]
  else
    log "CPU usage within normal range: $cpu_usage%"
  fi
}

# Function to check disk space
check_disk() {
  disk_threshold=90
  disk_usage=$(df -H | awk '$NF=="/" {print int($5)}')

  if [ "$disk_usage" -gt "$disk_threshold" ]; then
    log "High disk usage: $disk_usage%"
  else
    log "Disk usage within normal range: $disk_usage%"
  fi
}

check_cpu
check_disk
