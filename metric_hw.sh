#!/bin/bash

# Function to display CPU usage
function check_cpu_usage {
    echo "CPU Usage:"
    top -l 1 -s 0 | grep "CPU usage"
}

# Function to display memory usage
function check_memory_usage {
    echo "Memory Usage:"
    vm_stat | awk '{printf "Free: %.2fGB\nActive: %.2fGB\nInactive: %.2fGB\n", $6/1024/1024, $3/1024/1024, $5/1024/1024}'
}

# Function to display disk space
function check_disk_space {
    echo "Disk Space:"
    df -h
}

# Main function
function main {
    while true; do
        clear
        check_cpu_usage
        echo "-------------------------"
        check_memory_usage
        echo "-------------------------"
        check_disk_space
        sleep 5  # Refresh every 5 seconds
    done
}

# Redirect output to a text file
main > health_results.txt
