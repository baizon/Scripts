#!/bin/sh

MOUNT_OPTIONS="192.168.0.1/24(ro,no_subtree_check,insecure,sync)"
MOVIES_STRING="/srv/nfs/Movies"
TVSHOWS_STRING="/srv/nfs/TVShows"
EXPORTS_FILE_PATH="/etc/exports"

addExportsEntry() {
  echo "Checking for entry $1 within /etc/exports"
  if $(grep -q "$1" "$EXPORTS_FILE_PATH") ; then
    echo "Entry found, nothing to do."
  else
    echo "Adding entry to /etc/exports"
    echo $1 $MOUNT_OPTIONS >> $EXPORTS_FILE_PATH
    echo "Running exportfs to update..."
    sudo exportfs -arv
  fi
}

echo "Creating directory $MOVIES_STRING"
sudo mkdir -p $MOVIES_STRING
echo "Mounting Movies directory..."
sudo mount --bind /run/media/baizon/Data/Movies $MOVIES_STRING
addExportsEntry $MOVIES_STRING

echo "Creating directory $TVSHOWS_STRING"
sudo mkdir -p $TVSHOWS_STRING
echo "Mounting TV Shows directory..."
sudo mount --bind /run/media/baizon/Data/TVShows $TVSHOWS_STRING
addExportsEntry $TVSHOWS_STRING

echo "Starting NFS service..."
sudo systemctl start nfs-server
