#!/bin/bash
## /bin/bash nfs-mount.sh {nfs-server:/share source} {mountpoint destination}

source=$1
source=${source%/}
dest=$2
dest=${dest%/}

ISMOUNTED=`grep "$dest" /proc/mounts`

if [ "$ISMOUNTED" = "" ]
then
  sudo /bin/mount -t nfs -o rw,sync,vers=4,timeo=60,_netdev $source $dest
  echo "Berhasil di-mounting  : `grep $dest /proc/mounts`"
else
  echo "Sudah di-mounting  : $ISMOUNTED"
fi
