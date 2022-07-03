#! /bin/bash

#To collect CPU,Memoryand Disk usage

HOSTNAME=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")
CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
MEM_USAGE=$(free  | grep Mem | awk '{print $3/$2 * 100.0}')
DISK_USAGE=$(df -hP | awk '{print $5}' | head -n 2 | tail -n 1| sed 's/%//g')
#cut % using sed

 
echo " Hostname         : $HOSTNAME "
echo " Date & time      : $DATE" 
echo " CPU_used in %    : $CPU_USAGE"
echo " Mem_used in %    : $MEM_USAGE" 
echo " Disk_used in %   : $DISK_USAGE "
