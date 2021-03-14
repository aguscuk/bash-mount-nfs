#!/bin/bash
## /bin/bash nfs-mount.sh {nfs-server:/share source} {mountpoint destination}

source=$1
source=${source%/}
dest=$2
dest=${dest%/}

ISMOUNTED=`grep "$dest" /proc/mounts`

if [ "$ISMOUNTED" = "" ] 
then
  echo "----------------"
  echo "Mounting Process"
  echo "----------------"
  echo "/bin/mount -t nfs $source $dest"
  /bin/mount -t nfs $source $dest 
else
  echo "------------------"
  echo "Already mounted on"
  echo "------------------"
  echo "$ISMOUNTED"
fi
