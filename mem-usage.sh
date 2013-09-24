#!/bin/sh

free -t -m | grep "Total" | awk '{ print $3 "MB/" $2 "MB" }'
