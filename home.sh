#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

if [ 0 == $# ]; then
    adb shell input keyevent 3
    exit 1
fi

if [ 2 == $# ]; then
    if [ '-s' == $1 ]; then
        adb -s $2 shell input keyevent 3
        exit 1
    fi
fi

echo 'execute like this: '
echo '$ home.sh'
echo 'or'
echo '$ home.sh -s $device'