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

oneconf-disabler.sh
===================
A simple script which disables the <a href="https://wiki.ubuntu.com/OneConf">OneConf</a> synchronisation.

toggletouchpad.sh
=================
Uses the <code>xinput</code> command to toggle the touchpad. Additionally a <code>notify-send</code> is sent with a notification of the current touchpad state.

trim
====
Runs a trim command for a SSD drive. 
There are two configuration parameter:
- <code>LOG</code> - The path where the log should be saved. Default is <code>/var/log/trim.log</code>
- <code>DEVS</code> - a list of devices, which will be affected by the trim command. Drive-list is separeted by spaces. For example <code>"/ /home"</code> will check the mounted root drive "/" and the "/home" drive. For every driver a notification will be displayed.

hdd-usage.sh
============
Shows the HDD usage. Using <CODE>df -H</CODE> command.

apt-upd-upg.sh
==============
It's a simple script which runs <CODE>apt-get update</CODE> and <CODE>apt-get dist-upgrade</CODE> in the background. Also using options <CODE>-qy</CODE> for no output and auto-agree.
