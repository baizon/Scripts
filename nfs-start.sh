#!/bin/sh

# --- CONFIG ---------------------------------------------------
READ_MOUNT_OPTIONS="192.168.0.221/24(ro,no_subtree_check,sync)"
WRITE_MOUNT_OPTIONS="192.168.0.221/24(rw,no_subtree_check,sync)"
MOVIES_PATH="/mnt/data/Movies"
PICTURES_PATH="/mnt/data/Pictures"
TVSHOWS_PATH="/mnt/data/TVShows"
UPLOAD_PATH="/mnt/data/Upload"
EXPORTS_FILE_PATH="/etc/exports"
# --------------------------------------------------------------

addNfsDir() {
  if [ ! -d "$1" ]; then
    echo "Creating directory $1"
    sudo mkdir -p $1
  fi
}

addExportsEntry() {
  echo "Checking for entry $1 within /etc/exports"
  if $(grep -q "$1" "$EXPORTS_FILE_PATH") ; then
    echo "Entry found, nothing to do."
  else
    echo "Adding entry to /etc/exports"
    sudo sh -c "echo $1 '$2' >> $EXPORTS_FILE_PATH"
    echo "Running exportfs to update..."
    sudo exportfs -arv
  fi
}

echo "Adding Movies NFS (read)"
addNfsDir $MOVIES_PATH
addExportsEntry $MOVIES_PATH $READ_MOUNT_OPTIONS

echo "Adding Pictures NFS (read)"
addNfsDir $PICTURES_PATH
addExportsEntry $PICTURES_PATH $READ_MOUNT_OPTIONS

echo "Adding TV Shows NFS (read)"
addNfsDir $TVSHOWS_PATH
addExportsEntry $TVSHOWS_PATH $READ_MOUNT_OPTIONS

echo "Adding Upload NFS (write)"
addNfsDir $UPLOAD_PATH
addExportsEntry $UPLOAD_PATH $WRITE_MOUNT_OPTIONS

echo "Starting NFS service..."
sudo service nfs-kernel-server start
