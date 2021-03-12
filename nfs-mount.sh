#!/bin/sh

# --- CONFIG ---------------------------------------------------
NFS_HOST="debian"
MOVIES_NFS_PATH="/mnt/data/Movies"
MOVIES_LOCAL_PATH="/home/baizon/NFS/Movies"
PICTURES_NFS_PATH="/mnt/data/Pictures"
PICTURES_LOCAL_PATH="/home/baizon/NFS/Pictures"
TVSHOWS_NFS_PATH="/mnt/data/TVShows"
TVSHOWS_LOCAL_PATH="/home/baizon/NFS/TVShows"
UPLOAD_NFS_PATH="/mnt/data/Upload"
UPLOAD_LOCAL_PATH="/home/baizon/NFS/Upload"

# --------------------------------------------------------------

mountNfsDir() {
  echo "Mounting $2 from IP $1 to $3 directory..."
  sudo mount $1:$2 $3
}

mountNfsDir $NFS_HOST $MOVIES_NFS_PATH $MOVIES_LOCAL_PATH
mountNfsDir $NFS_HOST $PICTURES_NFS_PATH $PICTURES_LOCAL_PATH
mountNfsDir $NFS_HOST $TVSHOWS_NFS_PATH $TVSHOWS_LOCAL_PATH
mountNfsDir $NFS_HOST $UPLOAD_NFS_PATH $UPLOAD_LOCAL_PATH

read -p "All done. Press any key to continue..." input
