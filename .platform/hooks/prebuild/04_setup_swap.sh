#!/bin/bash

if [ ! -e "/swapfile" ]; then
  SWP=`free - h | cat | awk '$1=="Swap:"{print $0}' | awk '$2 == "0" && $3 == "0" && $4 == "0" { print "no" }'`
  MEM=`free - h | awk '$1=="Mem:"{print $2}'`
  SWPMEM=`echo "${MEM}/2" | bc | awk '{printf("%d", ($1 / 1000000))}'`
  SWAPSIZE=`echo "${SWPMEM}*1024" | bc`
  if [ $SWP = "no" ]; then
    sudo dd if=/dev/zero of=/swapfile bs=1M count=$SWAPSIZE
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    sudo sh -c 'echo "/swapfile swap swap defaults 0 0" >> /etc/fstab'
  fi
fi
