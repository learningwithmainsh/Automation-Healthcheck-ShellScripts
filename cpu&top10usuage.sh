#!/bin/bash
top -b  -n 1 -d1 | grep "Cpu(s)" | awk '{print $2 }'
ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%mem | head -15
