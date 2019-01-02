#!/bin/sh

MOVIES_STRING="/srv/nfs/Movies"
TVSHOWS_STRING="/srv/nfs/TVShows"

echo "Stopping NFS service..."
sudo systemctl stop nfs-server

echo "Unmounting Movies directory..."
sudo umount $MOVIES_STRING
echo "Removing $MOVIES_STRING"
sudo rm -rf $MOVIES_STRING

echo "Unmounting TV Shows directory..."
sudo umount $TVSHOWS_STRING
echo "Removing $TVSHOWS_STRING"
sudo rm -rf $TVSHOWS_STRING
