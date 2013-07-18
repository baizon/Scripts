#!/bin/sh

# --- CONFIG ---------------------------------------------------
CONF_APT_CACHE=true
CONF_UNUSED_APT=true
CONF_OLD_KERNELS=true
CONF_LOCALEPURGE=true
CONF_RESIDUAL_CONFIGS=true
CONF_DEBORPHAN=false
CONF_THUMBNAILS=false
CONF_LOGS=false
CONF_TRASH=true
# --------------------------------------------------------------

pause() {
 echo "Done."
 read -p "Press any key to continue..." input
}

boolTextColor() {
 if $2 ; then
  echo $1"\033[50G[\033[32m true \033[0m]"
 else 
  echo $1"\033[50G[\033[31m false \033[0m]"
 fi
}

# Info
echo "---------- CLEANING SCRIPT -------------------------------"
boolTextColor "Purging apt cache (autoclean & clean):" $CONF_APT_CACHE
boolTextColor "Removing unused apt packages (autoremove):" $CONF_UNUSED_APT
boolTextColor "Purging old kernels:" $CONF_OLD_KERNELS
boolTextColor "Localepurge:" $CONF_LOCALEPURGE
boolTextColor "Purging residual configs:" $CONF_RESIDUAL_CONFIGS
boolTextColor "Delete unnecessary (orphaned) packages:" $CONF_DEBORPHAN
boolTextColor "Cleaning thumbnails:" $CONF_THUMBNAILS
boolTextColor "Cleaning var/logs:" $CONF_LOGS
boolTextColor "Purging trash:" $CONF_TRASH
echo "----------------------------------------------------------"
# Purging apt cache
if $CONF_APT_CACHE ; then
 echo "\033[32mPurging apt cache (autoclean & clean):\033[0m"
 sudo apt-get autoclean
 sudo apt-get clean
fi

# Removing unused apt packages
if $CONF_UNUSED_APT ; then
 echo "\033[32mRemoving unused apt packages (autoremove):\033[0m"
 sudo apt-get -y autoremove
fi

# Purging old kernels
if $CONF_OLD_KERNELS ; then
 echo "\033[32mPurging old kernels:\033[0m"
 dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
fi

# Localepurge (localepurge needed)
if $CONF_LOCALEPURGE ; then
 echo "\033[32mLocalepurge:\033[0m"
 if which localepurge >/dev/null; then
  sudo localepurge
 else
  echo "Localepurge not installed, skipping." 
 fi
fi

# Removing residual configs
if $CONF_RESIDUAL_CONFIGS ; then
 echo "\033[32mPurging residual configs:\033[0m"
 PKGS=$(dpkg -l | grep '^rc' | tr -s ' ' | cut -d ' ' -f 2)
 if [ "$PKGS" != "" ]; then
  sudo dpkg --purge $PKGS
 else
  echo "Nothing to do here."
 fi
fi

# Delete unnecessary (orphaned) deb packages
if $CONF_DEBORPHAN ; then
 echo "\033[32mRunning deborphan:\033[0m"
 if which deborphan >/dev/null; then
  sudo deborphan | xargs sudo apt-get remove --purge
  echo "HINT: This packages also can be removed (--guess-all):"
  sudo deborphan --guess-all
 else
  echo "Deborphan not installed, skipping." 
 fi
fi
 
# Cleaning Thumbnails
if $CONF_THUMBNAILS ; then
 echo "\033[32mRemoving thumbnails:\033[0m"
 THUMBNAILS=$(find $HOME/.thumbnails -type f)
 if [ "$THUMBNAILS" != "" ]; then
  find $HOME/.thumbnails -type f | xargs rm -fv
 else 
  echo "Nothing to do here."
 fi
fi

# Cleaning /var/logs
if $CONF_LOGS ; then
 echo "\033[32mRemoving logs (var/logs):\033[0m"
 LOGS=$(find /var/log -type f -name "*.log.*.gz")
 if [ "$LOGS" != "" ]; then
  find /var/log -type f -name "*.log.*.gz" | xargs sudo rm -fv
 else 
  echo "Nothing to do here."
 fi
fi

# Purging trash
if $CONF_TRASH ; then
 echo "\033[32mPurging trash:\033[0m"
 rm -rfv $HOME/.local/share/Trash/*/**
fi

pause

