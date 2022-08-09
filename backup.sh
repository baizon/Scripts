#!/bin/sh

# --- CONFIG ---------------------------------------------------
# NOTE: path can't end with "/"!
DATE=$(date +%Y-%m-%d-%H%M%S)
HOSTNAME=$(uname -n)
BACKUP_DIR="$HOME/Documents/Backup"
BACKUP_FILE="$HOSTNAME-$DATE.tar.7z"
SOURCE="/etc/fstab /etc/default/grub /etc/locale.conf $HOME"
EXCLUDE_ARRAY=("--exclude=$BACKUP_DIR/$BACKUP_FILE")
EXCLUDE_ARRAY+=("--exclude=$HOME/.cache")
EXCLUDE_ARRAY+=("--exclude=$HOME/.java")
EXCLUDE_ARRAY+=("--exclude=$HOME/.steam")
EXCLUDE_ARRAY+=("--exclude=$HOME/.local/share/Trash")
EXCLUDE_ARRAY+=("--exclude=$HOME/.local/share/Steam")
EXCLUDE_ARRAY+=("--exclude=$HOME/Downloads/Torrents")
EXCLUDE_ARRAY+=("--exclude=$HOME/Downloads/Temp")
EXCLUDE_ARRAY+=("--exclude=$HOME/Downloads/DCC")
EXCLUDE="${EXCLUDE_ARRAY[@]}"
# --------------------------------------------------------------

echo "---------- BACKUP SCRIPT -------------------------"
echo "Source: $SOURCE"
echo "--------------------------------------------------"
echo "Destination: $BACKUP_DIR/$BACKUP_FILE"
echo "--------------------------------------------------"
echo "Exclude: $EXCLUDE"
echo "--------------------------------------------------"

read -p "All running processes terminated? (y/N) " rpinput
echo ""
if [ "$rpinput" = "y" ] || [ "$rpinput" = "Y" ]; then
  if [ -d $BACKUP_DIR ]; then
    read -p "Encrypt archive? (Y/n) " encinput
    echo ""
    if [ "$encinput" = "y" ] || [ "$encinput" = "Y" ] || [ "$encinput" = "" ]; then
      sudo sh -c "tar $EXCLUDE -cpf - $SOURCE | 7za a -p -mhe -mx7 -si $BACKUP_DIR/$BACKUP_FILE"
    elif [ "$encinput" = "n" ] || [ "$encinput" = "N" ]; then
      sudo sh -c "tar $EXCLUDE -cpf - $SOURCE | 7za a -mhe -mx7 -si $BACKUP_DIR/$BACKUP_FILE"
    fi
  else
    echo "Backup directory $BACKUP_DIR doesn't exist. Exiting."
  fi  
else
  echo "Aborting."
fi
read -p "Done. Press any key to continue..." input
