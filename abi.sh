#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

if [ 0 == $# ]; then
    adb shell getprop ro.product.cpu.abi
    exit 1
fi

if [ 2 == $# ]; then
    if [ '-s' == $1 ]; then
        adb -s $2 shell getprop ro.product.cpu.abi
        exit 1
    fi
fi

echo 'execute like this: '
echo '$ abi'
echo 'or'
echo '$ abi -s $device'