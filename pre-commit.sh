#!/bin/bash
#Do a check to see if a URL is availible. Pass URL as arugument. e.g ./pre-commit.sh www.google.com

status=$(curl -Is $1 | head -n 1 | grep -o 200)

sleep 3

if [[ $status == "200" ]]
		then
		echo "UP 200 ok | `date`" >> "/home/rex/Gtest/logs/status.log"
		Status=000
fi

echo $status

exit 0

