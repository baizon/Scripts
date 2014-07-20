#!/bin/sh

sudo sh -c "/usr/bin/apt-get -qy update > /dev/null"
sudo sh -c "/usr/bin/apt-get -qy dist-upgrade > /dev/null"
exit 0