#!/bin/sh

LOCATION="$HOME/Downloads"

read -p "Enter UMS version: " VERSION

UMSFILE="$LOCATION/UMS-$VERSION-Java8.tgz" 

echo "Downloading UMS:"
wget http://sourceforge.net/projects/unimediaserver/files/Official%20Releases/Linux/UMS-$VERSION-Java8.tgz -P $LOCATION
if [ -f $UMSFILE ]; then
 echo "Extracting files:"
 tar zxvf $UMSFILE -C $LOCATION
 echo "Removing /opt/ums/:"
 sudo rm -rvf /opt/ums/
 echo "Moving files from $HOME/Downloads/ums-$VERSION/ to /opt/ums/:"
 sudo mv -v $LOCATION/ums-$VERSION/ /opt/ums/
 echo "Removing temporary files:"
 rm -rvf $UMSFILE
 echo "All done. Exiting."
else
 echo "File $UMSFILE not found. Aborting."
fi

