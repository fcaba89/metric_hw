#!/bin/bash

# Thresholds
CPU_THRESHOLD=80 # in percentage
MEMORY_THRESHOLD=80 # in percentage

# Function to check CPU usage
check_cpu() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
        echo "CPU Usage: $cpu_usage%" >> metrics.txt
    if [ $cpu_usage -gt $CPU_THRESHOLD ]; then
        echo "CPU usage is above threshold! ($CPU_THRESHOLD%)" >> metrics.txt
        # You can add actions here like sending an alert/notification
    fi
}

# Function to check memory usage
check_memory() {
    memory_usage=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
    echo "Memory Usage: $memory_usage%" >> metrics.txt
    if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
        echo "Memory usage is above threshold! ($MEMORY_THRESHOLD%)" >> metrics.txt
        # You can add actions here like sending an alert/notification
    fi
}
# Function to check disk usage
check_disk() {
    echo "Disk Usage:" >> metrics.txt
    df -h
}

# Function to check the status of a specific service
check_service_status() {
    echo "Service Status:"
    service_name="ssh" # Change this to the service you want to monitor
    systemctl status $service_name
}

# Function to monitor logs
monitor_logs() {
    echo "Last 10 lines of syslog:"
    tail -n 10 /var/log/syslog # Change this to the log file you want to monitor
}

# Main function to execute monitoring tasks
main() {
    echo "Monitoring System Metrics and Services"
    echo "-------------------------------------"
    check_cpu
    check_memory
     check_disk
    check_service_status
    monitor_logs
}

# Execute main function
main
