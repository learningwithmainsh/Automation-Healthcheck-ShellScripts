#!/bin/bash
TO="mnshkmrpnd@gmail.com"
ram_free=$(free -mt| grep Total | awk '{print $4}')
#ram_free=$(free | grep Mem | awk '{print $3/$2*100}')
if [ $ram_free -le 1400 ]
then
	echo "sending maill because your mail size is less than 143"
	echo "Subject:Warning Ram size is $ram_free" | sendmail $TO

fi 
