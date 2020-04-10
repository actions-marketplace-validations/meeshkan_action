#!/bin/sh -l

time=$(date)
echo ::set-output name=meeshkan_time::$time

echo "First argument: $1"
echo "MEESHKAN_ENDPOINT: $MEESHKAN_ENDPOINT"
echo "MEESHKAN_TEST: $MEESHKAN_TEST"

echo "Trying to access entrypoint: $MEESHKAN_ENDPOINT"
curl $MEESHKAN_ENDPOINT


