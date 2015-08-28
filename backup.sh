#!/bin/sh

# --- CONFIG ---------------------------------------------------
# NOTE: path can't end with "/"!
DATE=$(date +%Y-%m-%d-%H%M%S)
HOSTNAME=$(uname -n)
BACKUP_DIR="$HOME/EncFS/Backup/Linux"
BACKUP_FILE="$HOSTNAME-$DATE.tar.7z"
SOURCE="/etc/default/grub /etc/anacrontab /etc/NetworkManager/system-connections $HOME"
EXCLUDE="--exclude=$HOME/$HOSTNAME-$DATE.tar.7z --exclude=$HOME/.cache --exclude=$HOME/.java --exclude=$HOME/.mozilla --exclude=$HOME/.steam --exclude=$HOME/.local/share/Trash --exclude=$HOME/.local/share/Steam --exclude=$HOME/.local/share/data --exclude=$HOME/.local/share/zeitgeist --exclude=$HOME/EncFS --exclude=$HOME/Downloads --exclude=$HOME/MEGA --exclude=$HOME/Wsiurki"
# --------------------------------------------------------------


backup() {
if $1; then
 sudo sh -c "tar -cpf - $SOURCE $EXCLUDE | 7za a -p -mhe -mmt -mx7 -si $HOME/$BACKUP_FILE"
else
 sudo sh -c "tar -cpf - $SOURCE $EXCLUDE | 7za a -mhe -mmt -mx7 -si $HOME/$BACKUP_FILE"
fi
cp $HOME/$BACKUP_FILE $BACKUP_DIR/$BACKUP_FILE
echo "\033[32mRemoving temporary files:\033[0m"
sudo sh -c "rm -vf $HOME/$HOSTNAME-$DATE.tar.7z"
}

backupAsk() {
read -p "Encrypt archive? (y/N) " input
echo ""
if [ "$input" = "y" ] || [ "$input" = "Y" ]; then
 backup true
elif [ "$input" = "n" ] || [ "$input" = "N" ] || [ "$input" = "" ]; then
 backup false
fi
}


echo "---------- BACKUP SCRIPT -------------------------"
echo "\033[32mSource\033[0m: $SOURCE"
echo "--------------------------------------------------"
echo "\033[32mDestination\033[0m: $BACKUP_DIR"
echo "--------------------------------------------------"
echo "\033[32mExclude\033[0m: $EXCLUDE"
echo "--------------------------------------------------"


if [ -d $BACKUP_DIR ]; then
 read -p "Delete all other backups? (y/N/q) " input
 echo ""
 if [ "$input" = "y" ] || [ "$input" = "Y" ]; then
  echo "\033[32mRemoving old Backup files.\033[0m"
  rm -vf $BACKUP_DIR/*-*.tar.7z
  backupAsk
 elif [ "$input" = "n" ] || [ "$input" = "N" ] || [ "$input" = "" ]; then
  backupAsk
 elif [ "$input" = "q" ] || [ "$input" = "Q" ]; then
  echo "Aborting."
 else 
  echo "Wrong input! Exiting."
 fi
else
 echo "Backup directory $BACKUP_DIR doesn't exist. Exiting."
fi

read -p "All done. Press any key to continue..." input
