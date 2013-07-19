Scripts
=======
This repository contains a collection of my personal scripts. I use them under Ubuntu, it can be mapped on other debian-distributions.

TODO: Complete documentation.

cleaner.sh
==========
Cleaning script:
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
Checks if Dropbox is up to date. It compares the version with the latest stable forum build (https://forums.dropbox.com). The new file is gonna be downloaded from: https://dl-web.dropbox.com/u/17/

oneconf-disabler.sh
===================
A simple script which disables the <a href="https://wiki.ubuntu.com/OneConf">OneConf</a> synchronisation.

toggletouchpad.sh
=================
Uses the <code>xinput</code> command to toggle the touchpad. Additionally a <code>notify-send</code> is sent with a notification of the current touchpad state.

trim
====
Runs a trim command for a SSD drive. Every time the script was realized, a notification (<code>notify-send</code>) will pop up.
There are two configuration parameter:
- <code>LOG</code> - The path where the log should be saved. Default is <code>/var/log/trim.log</code>
- <code>DEVS</code> - a list of devices, which will be affected by the trim command. Drive-list is separeted by spaces. For example <code>"/ /home"</code> will check the mounted root drive "/" and the "/home" drive.
