#!/bin/sh -l

echo "First argument: $1"
echo "MEESHKAN_ENDPOINT: $MEESHKAN_ENDPOINT"
echo "MEESHKAN_TEST: $MEESHKAN_TEST"

time=$(date)
echo ::set-output name=meeshkan_time::$time

