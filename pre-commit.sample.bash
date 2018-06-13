#!/bin/bash

URL = $1

$status curl --write-out "%{http_code}\n" --silent --output /dev/null "$URL"

if [ "$status" -eq 200 ]
		then
		echo "UP | `date`" >> "/home/rex/Gtest/logs/$url-status.log"
		Status=000
fi

exit 0

