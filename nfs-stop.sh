#!/bin/sh

# --- CONFIG ----------------------
MOVIES_STRING="/mnt/data/Movies"
PICTURES_STRING="/mnt/data/Pictures"
TVSHOWS_STRING="/mnt/data/TVShows"
UPLOAD_STRING="/mnt/data/Upload"
# ---------------------------------

echo "Stopping NFS service..."
sudo service nfs-kernel-server stop

echo "Unmounting Movies directory..."
sudo umount $MOVIES_STRING

echo "Unmounting Pictures directory..."
sudo umount $PICTURES_STRING

echo "Unmounting TV Shows directory..."
sudo umount $TVSHOWS_STRING

echo "Unmounting Upload directory..."
sudo umount $UPLOAD_STRING

