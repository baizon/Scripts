Scripts
=======
This repository contains a collection of my personal scripts.

TODO: Complete documentation.

cleaner.sh
==========
Cleaning script for debian-based distributions (can be mapped on other distributions).
It contains the following cleaning components:
- "Purging apt cache (autoclean & clean)"
- "Removing unused apt packages (autoremove)"
- "Purging old kernels"
- "Localepurge"
- "Purging residual configs"
- "Delete unnecessary (orphaned) packages"
- "Cleaning thumbnails"
- "Cleaning var/logs"
- "Purging trash"

dropbox-updater.sh
==================
Checks if Dropbox is up to date. It compares the version with the latest stable forum build (https://forums.dropbox.com). The new file is gonna be downloaded from: https://dl-web.dropbox.com/u/17/<dropbox-filename>.tar.gz

oneconf-disabler.sh
===================
A simple script which disables the one-conf synchronisation of the software center (Canonical thing).

toggletouchpad.sh
=================
Uses the xinput command to toggle the touchpad. Additionally a notify-send is sent with a notification of the current touchpad state.

trim
====
Runs a trim command for a SSD drive. Every time the script was realized, a notification (notify-send) will pop up.
There are two configuration parameter:
- LOG - The path where the log should be saved. Default is /var/log/trim.log
- DEVS - a list of devices, which will be affected by the trim command. Drive-list is separeted by spaces. For example "/ /home" will check the mounted root drive "/" and the "/home" drive.
