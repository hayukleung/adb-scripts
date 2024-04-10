#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

if [ 1 == $# ]; then
    adb pull $(adb shell pm path $(./showCurrentPackageName.sh) | awk -F "package:" '{print $2}') $1
    exit 1
fi

if [ 3 == $# ]; then
    if [ '-s' == $1 ]; then
        adb pull $(adb -s $2 shell pm path $(./showCurrentPackageName.sh $1 $2) | awk -F "package:" '{print $2}') $3
        exit 1
    fi
fi

echo 'execute like this: '
echo '$ exportAPK.sh $targetPath'
echo 'or'
echo '$ exportAPK.sh -s $device $targetPath'