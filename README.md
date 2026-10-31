Scripts
=======
This repository contains a collection of my personal scripts. I use them under <a href="https://cachyos.org/">CachyOS</a>.

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

nfs-start.sh
============
Mounts and starts (with <CODE>systemctl</CODE>) a NFS.

nfs-stop.sh
============
Stops, unmounts and removes the NFS.

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

llama-server.sh
===============
Script to run a local LLM server using llama.cpp's llama-server:

Configuration parameters:
- <CODE>MODEL</CODE> - The model to use (default: "unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_XL")
- <CODE>CONTEXT_SIZE</CODE> - Context window size (default: 64384)
- <CODE>PORT</CODE> - Port to run the server on (default: 9931)

The script requires llama.cpp to be installed and available in your PATH. It will automatically check for the presence of the llama-server command before starting.

nfs-mount.sh
============
Script to mount NFS shares from a remote host.

nfs-umount.sh
=============
Script to unmount all configured NFS shares.

wol-install.sh
==============
Script to install and enable Wake-on-LAN (WoL) service:

This script creates a systemd service that configures Wake-on-LAN for the eno1 network interface.
It writes a configuration file to /etc/systemd/system/wol.service and enables it.
