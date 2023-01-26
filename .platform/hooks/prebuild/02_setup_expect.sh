#!/bin/bash
source ~/.bashrc
if !(type "expect" > /dev/null 2>&1); then
  yes | sudo yum install expect
fi