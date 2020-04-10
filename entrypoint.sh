#!/bin/sh -l

time=$(date)
echo ::set-output name=meeshkan_time::$time

echo "First argument: $1"
echo "MEESHKAN_ENDPOINT: $MEESHKAN_ENDPOINT"
echo "MEESHKAN_TEST: $MEESHKAN_TEST"

hostip=$(ip route show | awk '/default/ {print $3}')
export BASE_URL="http://${hostip}:8080/"

echo "Trying to access entrypoint: $BASE_URL"
curl $BASE_URL


