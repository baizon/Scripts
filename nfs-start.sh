#!/bin/sh

# --- CONFIG ---------------------------------------------------
MOUNT_OPTIONS="192.168.0.1/24(ro,no_subtree_check,insecure,sync)"
MOVIES_DISK_PATH="/run/media/baizon/Data/Movies"
TVSHOWS_DISK_PATH="/run/media/baizon/Data/TVShows"
MOVIES_NFS_PATH="/srv/nfs/Movies"
TVSHOWS_NFS_PATH="/srv/nfs/TVShows"
EXPORTS_FILE_PATH="/etc/exports"
# --------------------------------------------------------------

addNfsDir() {
  if [ ! -d "$1" ]; then
    echo "Creating directory $1"
    sudo mkdir -p $1
  fi
}

mountNfsDir() {
echo "Mounting $2 directory..."
sudo mount --bind $1 $2
}

addExportsEntry() {
  echo "Checking for entry $1 within /etc/exports"
  if $(grep -q "$1" "$EXPORTS_FILE_PATH") ; then
    echo "Entry found, nothing to do."
  else
    echo "Adding entry to /etc/exports"
    sudo sh -c "echo $1 '$MOUNT_OPTIONS' >> $EXPORTS_FILE_PATH"
    echo "Running exportfs to update..."
    sudo exportfs -arv
  fi
}

# Adding Movies NFS
addNfsDir $MOVIES_NFS_PATH
mountNfsDir $MOVIES_DISK_PATH $MOVIES_NFS_PATH
addExportsEntry $MOVIES_NFS_PATH

# Adding TV Shows NFS
addNfsDir $TVSHOWS_NFS_PATH
mountNfsDir $TVSHOWS_DISK_PATH $TVSHOWS_NFS_PATH
addExportsEntry $TVSHOWS_NFS_PATH

echo "Starting NFS service..."
sudo systemctl start nfs-server
read -p "All done. Press any key to continue..." input
