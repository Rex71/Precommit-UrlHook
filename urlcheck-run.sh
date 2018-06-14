#!/bin/bash
#Do a check to see if a URL is availible. Pass URL as arugument. e.g ./urlcheck-run.sh www.google.com

# STASH_NAME="pre-commit-$(date +%s)"
# git stash save -q --keep-index $STASH_NAME

#test

#STASHES=$(git stash list)
#if [[ $STASHES == "$STASH_NAME" ]]; then
#  git stash pop -q
#fi


statush=$(curl -Is $1 | head -n 1)

sleep 6

status200=$(echo $statush | grep -o 200)
status302=$(echo $statush | grep -o 302)

if [[ ! -e /var/log/urlstatus.log ]];
		then
    		sudo touch /var/log/urlstatus.log
		sudo touch /var/log/urlstatus.err
fi

if [[ $status200 == "200" ]];
		then
		echo "UP 200 ok | `date`" >> "/var/log/urlstatus.log"
echo $status200
elif [[ $status302 == "302" ]];
		then
		echo "UP 302 Found | `date`" >> "/var/log/urlstatus.log"
echo $status302
else
		echo "Error | `date`" >> "/var/log/urlstatus.err"
		echo $statush  >> "/var/log/urlstatus.err"
echo $statush Error
fi

exit 0
k
