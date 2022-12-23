#!/bin/bash
date
ansible-playbook check.yml > output.csv
cat output.csv  | grep Node > final.csv
sed 's/n/ /g' final.csv > result.csv


echo "Host|CPU Utilizatio | DiskUsage|MemoryUsage"
cat result.csv | awk '{ print $6 $7, $8, $9 }'  > data.csv 
cat data.csv
