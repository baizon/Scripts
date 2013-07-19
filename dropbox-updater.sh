#!/bin/sh

URL="https://dl-web.dropbox.com/u/17/"
LOCAL_VERSION=$(cat $HOME/.dropbox-dist/VERSION)
OS_TYPE=$(uname -m)
COLOR_GREEN="\033[32m"
ENDCOLOR="\033[0m"

VersionColor() {
 if [ "$2" = "$REMOTE_VERSION" ]; then
  echo $1"\033[32m $2 \033[0m"
 else 
  echo $1"\033[31m $2 \033[0m"
 fi
}


echo "----- Dropbox Update Script -----"
echo "\033[32mChecking Dropbox versions...\033[0m"

REMOTE_VERSION=$(wget https://forums.dropbox.com -q -O - | grep -o -P 'Stable Build - .{0,10}' | cut -c 16-40 | grep -o -P '^[^<]+')

VersionColor "Remote version: " $REMOTE_VERSION
VersionColor "Local version:  " $LOCAL_VERSION

if [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then
 echo "Dropbox up to date." 
else
 read -p "Update to the latest version? (Y/n) " INPUT
 echo ""
 if [ "$INPUT" = "y" ] || [ "$INPUT" = "Y" ]; then
  if [ "$OS_TYPE" = "x86_64" ]; then
   OS_TYPE="x86_64"
  else
   OS_TYPE="x86"
  fi
  DROPBOX_FILE="dropbox-lnx.$OS_TYPE-$REMOTE_VERSION.tar.gz"
  echo $COLOR_GREEN"Stopping Dropbox process..."$ENDCOLOR
  sh -c "dropbox stop"
  echo $COLOR_GREEN"Downloading Dropbox file from $URL ..."$ENDCOLOR
  wget $URL$DROPBOX_FILE -P $HOME
  if [ -f $HOME/$DROPBOX_FILE ]; then
   echo $COLOR_GREEN"Removing Dropbox Folder..."$ENDCOLOR
   rm -r $HOME/.dropbox-dist
   echo $COLOR_GREEN"Unpacking Dropbox File..."$ENDCOLOR
   tar -xvf $HOME/$DROPBOX_FILE -C $HOME
   echo $COLOR_GREEN"Starting Dropbox process..."$ENDCOLOR
   sh -c "dropbox start"
   echo $COLOR_GREEN"Removing Dropbox archive..."$ENDCOLOR
   rm -v $HOME/$DROPBOX_FILE
  else 
   echo "Download failed. Aborting!"
   echo $COLOR_GREEN"Starting Dropbox process..."$ENDCOLOR
   sh -c "dropbox start"
  fi
 fi
fi

echo "Done."
read -p "Press any key to continue..." input

# Downloads the files from internet.
# dropbox stop
# rm -r ~/.dropbox-dist
# dropbox start -i 
