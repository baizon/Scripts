#!/bin/sh

LOCATION="$HOME/Downloads"

VERSION=$(curl https://www.universalmediaserver.com/download/ | grep -o -P '(?<=UMS-).*(?=-x86_64.tgz)')

UMSFILE="$LOCATION/UMS-$VERSION-x86_64.tgz" 

echo "Downloading UMS to $LOCATION:"
wget https://sourceforge.net/projects/unimediaserver/files/$VERSION/UMS-$VERSION-x86_64.tgz -P $LOCATION
if [ -f $UMSFILE ]; then
 echo "Extracting files:"
 tar zxvf $UMSFILE -C $LOCATION
 read -p "Clean /opt/ums/? (y/N) " rpinput
 echo ""
 if [ "$rpinput" = "y" ] || [ "$rpinput" = "Y" ]; then
  echo "Removing /opt/ums/:"
  sudo rm -rvf /opt/ums/
 fi
 echo "Moving files from $HOME/Downloads/ums-$VERSION/ to /opt/ums/:"
 sudo mv -v $LOCATION/ums-$VERSION/ /opt/ums/
 echo "Removing temporary files:"
 rm -rvf $UMSFILE
 echo "All done. Exiting."
else
 echo "File $UMSFILE not found. Aborting."
fi
