#!/bin/bash

#trap 'jobs -p | xargs kill' EXIT
trap 'kill $(ps aux | grep '"'"'[p]ython3 cpu-'"'"' | awk '"'"'{print $2}'"'"')' EXIT

if [ -f data.db ];
then
    rm data.db
fi
python3 cpu-temperature.py &
python3 cpu-flask.py &
wait
:<<!
while [[ 1==1 ]]; do
    python3 cpu-temperature.py 
    wait
    sleep 60
    #statements
done
!