This Bash script provides a simple system health check by monitoring CPU usage, memory usage, and disk space. The results are displayed on the terminal and redirected to a text file (health_results.txt).
Prerequisites

    This script is intended for Unix-like systems with Bash support.
    Ensure that the necessary command-line tools (top, vm_stat, df) are available on your system.

Usage

    Save the script to a file, e.g., system_health_check.sh.
    Make the script executable: chmod +x system_health_check.sh.
    Run the script: ./system_health_check.sh.
    The script will display real-time system health information, refreshing every 5 seconds.
    Results are also saved to health_results.txt for future reference.

Functions

    Check CPU Usage:
        Displays CPU usage using the top command.

    Check Memory Usage:
        Displays free, active, and inactive memory using the vm_stat command.

    Check Disk Space:
        Displays disk space information using the df command.

Output

The script provides an overview of CPU usage, memory usage, and disk space in a structured format. The results are continuously updated in the terminal and saved to health_results.txt.
