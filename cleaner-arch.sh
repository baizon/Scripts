#!/bin/sh

# --- CONFIG ---------------------------------------------------
CONF_PACCACHE=true
CONF_PACMAN_ORPHAN=true
CONF_THUMBNAILS=false
CONF_LOGS=false
CONF_TRASH=false
# --------------------------------------------------------------
boolText() {
 if $2 ; then
  echo $1" true"
 else 
  echo $1" false"
 fi
}

# Info
echo "---------- CLEANING SCRIPT -------------------------------"
boolText "Pruning old package cache (paccache):" $CONF_PACCACHE
boolText "Orphan Package Removal:" $CONF_PACMAN_ORPHAN
boolText "Cleaning thumbnails:" $CONF_THUMBNAILS
boolText "Cleaning var/logs:" $CONF_LOGS
boolText "Purging trash:" $CONF_TRASH
echo "----------------------------------------------------------"
# Pruning paccache
if $CONF_PACCACHE ; then
 echo "Pruning old package cache (paccache):"
 sudo paccache -rvk3
fi

# Orphan Package Removal
if $CONF_PACMAN_ORPHAN ; then
 echo "Orphan Package Removal:"
 sudo pacman -Rns $(pacman -Qqdt)
fi

# Cleaning Thumbnails
if $CONF_THUMBNAILS ; then
 echo "Removing thumbnails:"
 THUMBNAILS=$(find $HOME/.thumbnails -type f)
 if [ "$THUMBNAILS" != "" ]; then
  find $HOME/.thumbnails -type f -delete -print
 else 
  echo "Nothing to do here."
 fi
fi

# Cleaning /var/logs
if $CONF_LOGS ; then
 echo "Removing logs (var/logs):"
 LOGS=$(find /var/log -type f -name "*.log.*.gz")
 if [ "$LOGS" != "" ]; then
  find /var/log -type f -delete -print -name "*.log.*.gz"
 else 
  echo "Nothing to do here."
 fi
fi

# Purging trash
if $CONF_TRASH ; then
 echo "Purging trash:"
 rm -rfv $HOME/.local/share/Trash/*/**
 echo "Done."
fi

read -p "All done. Press any key to continue..." input