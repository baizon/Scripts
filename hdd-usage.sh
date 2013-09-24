#!/bin/sh

df -H | grep -vE '^Filesystem|tmpfs|cdrom|none|udev' | awk '{ print $6 " " $3 "/" $2 }'
