System Metrics Monitor

This bash script is created to monitor various system metrics and services as well as create a text file for the output.

STEPS TAKEN
Making sure the script is execuatable with permissions: chmod +x bash_hw.sh
Executing the script: ./bash_hw.sh
Setting the treshold to 80% which is changeable 
Writting various functions: check_cpu(), check_memory(), check disk(), check_services(), add metrics.txt to save outputs to
Monitoring logs: /var/log/syslog
