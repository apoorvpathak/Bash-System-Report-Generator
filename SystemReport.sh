#!/bin/bash

REPORT="SYSTEM_REPORT.txt" #ASSIGN VARIABLE FOR REPORT FILE NAME




#FUNCTIONS TO GET SYSTEM STATS
cpu_data(){
    echo "CPU:"
    uptime | awk -F'average load:' '{ print $2 }' | sed 's/,/ /g'
}
memory_usage(){
    echo "Memory Usage:"
    free -h | grep Mem | awk '{print "Total: " $2 ", Used: " $3 ", Free: " $4}'
}
disk_space(){
    echo "Disk Space Usage:"
    df -h --total | grep 'total'
}
network_activity(){
    echo "Network Activity:"
    ip -s link
}



#CREATE REPORT FILE
echo "System Health Dashboard" > "$REPORT"
echo "=====================" >> "$REPORT"
echo "" >> "$REPORT"


#APPEND SYSTEM STAT TO REPORT FILE
cpu_data >> "$REPORT"
echo "" >> "$REPORT"

memory_usage >> "$REPORT"
echo "" >> "$REPORT"

disk_space >> "$REPORT"
echo "" >> "$REPORT"

network_activity >> "$REPORT"
echo "" >> "$REPORT"

#DISPLAY FILE
cat "$REPORT"

#PRINT MESSAGE THAT FILE GENERATED
echo "System health dashboard generated in $REPORT_FILE"