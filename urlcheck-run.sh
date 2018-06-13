#!/bin/bash
#Do a check to see if a URL is availible. Pass URL as arugument. e.g ./urlcheck-run.sh www.google.com

# pre-commit.sh

# STASH_NAME="pre-commit-$(date +%s)"
# git stash save -q --keep-index $STASH_NAME

#test

#STASHES=$(git stash list)
#if [[ $STASHES == "$STASH_NAME" ]]; then
#  git stash pop -q
#fi

statush=$(curl -Is $1 | head -n 1)

sleep 3

status200=$(echo $statush | grep -o 200)
status302=$(echo $statush | grep -o 302)

if [[ $status200 == "200" ]]
		then
		echo "UP 200 ok | `date`" >> "~/status.log"
echo $status200
elif [[ $status302 == "302" ]]
		then
		echo "UP 302 Found | `date`" >> "~/status.log"
echo $status302
else
		echo "error"
echo $statush
fi

exit 0

