#!/bin/sh

# --- CONFIG ---------------------------------------------------
NFS_IP="debian"
MOVIES_NFS_PATH="/srv/nfs/Movies"
MOVIES_LOCAL_PATH="/home/baizon/NFS/Movies"
PICTURES_NFS_PATH="/srv/nfs/Pictures"
PICTURES_LOCAL_PATH="/home/baizon/NFS/Pictures"
TVSHOWS_NFS_PATH="/srv/nfs/TVShows"
TVSHOWS_LOCAL_PATH="/home/baizon/NFS/TVShows"
UPLOAD_NFS_PATH="/srv/nfs/Upload"
UPLOAD_LOCAL_PATH="/home/baizon/NFS/Upload"

# --------------------------------------------------------------

mountNfsDir() {
  echo "Mounting $2 from IP $1 to $3 directory..."
  sudo mount $1:$2 $3
}

mountNfsDir $NFS_IP $MOVIES_NFS_PATH $MOVIES_LOCAL_PATH
mountNfsDir $NFS_IP $PICTURES_NFS_PATH $PICTURES_LOCAL_PATH
mountNfsDir $NFS_IP $TVSHOWS_NFS_PATH $TVSHOWS_LOCAL_PATH
mountNfsDir $NFS_IP $UPLOAD_NFS_PATH $UPLOAD_LOCAL_PATH

read -p "All done. Press any key to continue..." input
