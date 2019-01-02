Scripts
=======
This repository contains a collection of my personal scripts. I use them under <a href="https://www.manjaro.org">Manjaro</a>.

TODO: Complete documentation.

backup.sh
==========
Own backup script of HOME (and some other config files). It creates a .tar.7z archive (can also be encrypted).

cleaner-arch.sh
===============
Cleaning script for arch-based systems:
It contains the following cleaning components:
- "Pruning old package cache (paccache)"
- "Orphan Package Removal"
- "Cleaning thumbnails"
- "Cleaning var/logs"
- "Purging trash"

cleaner-deb.sh
==============
Cleaning script for debian-based systems:
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

hdd-usage.sh
============
Shows the HDD usage. Using <CODE>df -H</CODE> command.

nfs-start.sh
============
Mounts and starts (with <CODE>systemctl</CODE>) a NFS. Configuration parameters:
- <CODE>MOUNT_OPTIONS</CODE> - Mounts options of for the exports file
- <CODE>MOVIES_DISK_PATH</CODE> - Folder path
- <CODE>TVSHOWS_DISK_PATH</CODE> - Folder path
- <CODE>MOVIES_NFS_PATH</CODE> - NFS path
- <CODE>TVSHOWS_NFS_PATH</CODE> - NFS path
- <CODE>EXPORTS_FILE_PATH</CODE> - Path of the exports config (<CODE>/etc/exports</CODE>)

nfs-stop.sh
============
Stops, unmounts and removes the NFS. Configuration parameters:
- <CODE>MOVIES_STRING</CODE> - NFS path
- <CODE>TVSHOWS_STRING</CODE> - NFS path 

toggletouchpad.sh
=================
Uses the <code>xinput</code> command to toggle the touchpad. Additionally a <code>notify-send</code> is sent with a notification of the current touchpad state.

trim
====
Runs a trim command for a SSD drive. 
There are two configuration parameter:
- <code>LOG</code> - The path where the log should be saved. Default is <code>/var/log/trim.log</code>
- <code>DEVS</code> - a list of devices, which will be affected by the trim command. Drive-list is separeted by spaces. For example <code>"/ /home"</code> will check the mounted root drive "/" and the "/home" drive. For every driver a notification will be displayed.

update-grub.sh
==============
A simple script for my arch system, which runs <CODE>grub-mkconfig -o /boot/grub/grub.cfg "$@"</CODE>.

upgrade-ums.sh
===================
A script that upgrades <a href="https://www.universalmediaserver.com">Universal Media Server</a>.
