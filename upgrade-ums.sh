#!/bin/sh

LOCATION="$HOME/Downloads"

read -p "Enter UMS version: " VERSION
echo ""

UMSFILE="$LOCATION/UMS-$VERSION-Java8.tgz" 

if [ -f $UMSFILE ]; then
 echo "Extracting files:"
 tar zxvf $UMSFILE -C $LOCATION/
 echo "Removing /opt/ums/:"
 sudo rm -rvf /opt/ums/
 echo "Moving files from $HOME/Downloads/ums-$VERSION/ to /opt/ums/:"
 sudo mv $LOCATION/ums-$VERSION/ /opt/ums/
 echo "All done. Exiting."
else
 echo "File $UMSFILE not found. Aborting."
fi

