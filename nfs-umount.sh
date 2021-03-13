#!/bin/sh

# --- CONFIG ---------------------------------------------------
MOVIES_LOCAL_PATH="/home/baizon/NFS/Movies"
PICTURES_LOCAL_PATH="/home/baizon/NFS/Pictures"
TVSHOWS_LOCAL_PATH="/home/baizon/NFS/TVShows"
UPLOAD_LOCAL_PATH="/home/baizon/NFS/Upload"
# --------------------------------------------------------------

umountNfsDir() {
  echo "Unmounting $1 directory..."
  sudo umount $1
}

umountNfsDir $MOVIES_LOCAL_PATH
umountNfsDir $PICTURES_LOCAL_PATH
umountNfsDir $TVSHOWS_LOCAL_PATH
umountNfsDir $UPLOAD_LOCAL_PATH

read -p "All done. Press any key to continue..." input
