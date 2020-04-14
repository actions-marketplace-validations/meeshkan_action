#!/bin/sh -l

echo "Version: 5"

time=$(date)
echo ::set-output name=meeshkan_time::$time

# echo "First argument: $1"
# echo "MEESHKAN_ENDPOINT: $MEESHKAN_ENDPOINT"
# echo "MEESHKAN_TEST: $MEESHKAN_TEST"

# See https://github.community/t5/GitHub-Actions/Docker-networking-inside-a-job/td-p/34621#
# and the there referenced https://github.com/chrispat/next-aws-lambda/commit/5f72ecb96dca8275773af0392f5dcbf2f5d5627f
# and https://stackoverflow.com/questions/31324981/how-to-access-host-port-from-docker-container
HOST_IP=$(ip route show | awk '/default/ {print $3}')
REWRITTEN_ENDPOINT=$(echo $MEESHKAN_ENDPOINT | sed "s/\/\/localhost/\/\/$HOST_IP/")

# echo "Original endpoint: $MEESHKAN_ENDPOINT"
# echo "Rewritten endpoint: $REWRITTEN_ENDPOINT"

MEESHKAN_SERVER_UP=false
for i in `seq 20`; do
    curl $REWRITTEN_ENDPOINT # > /dev/null 2> /dev/null
    if [ $? = 0 ]; then
        MEESHKAN_SERVER_UP=true
        break
    fi
    echo "Awaiting server..."
    sleep 6
done

if [ $MEESHKAN_SERVER_UP = false ]; then
    echo "ERROR: Server is not responding on $REWRITTEN_ENDPOINT"
    exit 1
fi

# curl $BASE_URL
schemathesis run $REWRITTEN_ENDPOINT
