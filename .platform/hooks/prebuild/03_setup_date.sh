#!/bin/bash
dir=/etc/sysconfig/
filename=clock
filein="$dir$filename"
fileout="./$filename"

: > $fileout

while read line; do
  if [[ $line == "ZONE=\"UTC\"" ]]; then
    tmp=${line/"UTC"/"Japan"}
    sudo echo $tmp >> $fileout
  else
    sudo echo $line >> $fileout
  fi
done < $filein

sudo mv $fileout $filein
sudo ln -sf /usr/share/zoneinfo/Japan /etc/localtime