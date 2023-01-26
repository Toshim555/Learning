#!/bin/bash
dir=/etc/
filename=sysctl.conf
filein="$dir$filename"

exists="false"
while read line; do
  if [[ $line == "vm.swappiness = 10" ]]; then
    exists="true"
  fi
done < $filein

if [[ $exists == "false" ]]; then
  sudo sh -c 'echo "vm.swappiness = 10" >> /etc/sysctl.conf'
fi