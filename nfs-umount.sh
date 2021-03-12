#!/bin/sh

# --- CONFIG ---------------------------------------------------
MOVIES_LOCAL_PATH="/home/baizon/NFS/Movies"
PICTURES_LOCAL_PATH="/home/baizon/NFS/Pictures"
TVSHOWS_LOCAL_PATH="/home/baizon/NFS/TVShows"
UPLOAD_LOCAL_PATH="/home/baizon/NFS/Upload"
# --------------------------------------------------------------

mountNfsDir() {
  echo "Mounting $2 from IP $1 to $3 directory..."
  sudo umount $1
}

mountNfsDir $MOVIES_LOCAL_PATH
mountNfsDir $PICTURES_LOCAL_PATH
mountNfsDir $TVSHOWS_LOCAL_PATH
mountNfsDir $UPLOAD_LOCAL_PATH

read -p "All done. Press any key to continue..." input
