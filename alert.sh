#!/bin/bash
# To CPU, MEM , DISK USAGE from multiple servers
#Author:Manish
#Format: Hostname,Datetime,CPU%  MEM%, DISK%
HOSTNAME=$(hostname)
DATET=$(date "+%Y-%m-%d %H:%M:%S")
CPUUSAGE=$(top -b  -n 1 -d1 | grep "Cpu(s)" | awk '{print $2 }' |awk -F. '{print $1}')
MEMUSAGE=$(free | grep Mem | awk '{print $3/$2 *1 00.0}')
DISKUSAGE=$(df -P | column -t | awk '{print $5}' | tail -n 1 | sed 's/%//g')

echo "Hostname,Datetime,CPU%  MEM%, DISK%" >> /home/ubuntu/allalert/usagereport
echo "$HOSTNAME, $DATET, $CPUUSAGE, $MEMUSAGE, $DISKUSAGE" >> /home/ubuntu/allalert/usagereport

#for i  in `cat /home/oem/scripts/hostlist`;
#do


#RHOSTNAME=$(ssh $i hostname)
#RDATET=$(ssh $i date "+%Y-%m-%d %H:%M:%S")
#RCPUUSAGE=$( ssh $i top -b  -n 1 -d1 | grep "Cpu(s)" | awk '{print $2 }' |awk -F. '{print $1}')
#RMEMUSAGE=$( ssh $i free | grep Mem | awk '{print $3/$2 *1 00.0}')
#RDISKUSAGE=$(ssh $i df -P | column -t | awk '{print $5}' | tail -n 1 | sed 's/%//g')

#echo "Hostname,Datetime,CPU%  MEM%, DISK%" >> /opt/usagereport
#echo "$RHOSTNAME, $RDATET, $RCPUUSAGE, $RMEMUSAGE, $RDISKUSAGE" >> /opt/usagereport
#done
