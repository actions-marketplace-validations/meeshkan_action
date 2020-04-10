#!/bin/sh -l

time=$(date)
echo ::set-output name=meeshkan_time::$time

echo "First argument: $1"
echo "MEESHKAN_ENDPOINT: $MEESHKAN_ENDPOINT"
echo "MEESHKAN_TEST: $MEESHKAN_TEST"

# See https://github.community/t5/GitHub-Actions/Docker-networking-inside-a-job/td-p/34621#
# and the there referenced https://github.com/chrispat/next-aws-lambda/commit/5f72ecb96dca8275773af0392f5dcbf2f5d5627f
# and https://stackoverflow.com/questions/31324981/how-to-access-host-port-from-docker-container
hostip=$(ip route show | awk '/default/ {print $3}')
export BASE_URL="http://${hostip}:8080/"

echo "Trying to access entrypoint: $BASE_URL"
curl $BASE_URL


