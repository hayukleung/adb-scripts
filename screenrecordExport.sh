#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

if [ ! -d $1 ]; then
    mkdir -p $1
fi
sadb pull sdcard/test01.mp4 $1
