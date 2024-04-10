#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

if [ 0 == $# ]; then
    adb shell dumpsys activity | grep "mResume"            | awk '{printf $4}' | awk -F "}" '{print $1}' # <= android 12
    adb shell dumpsys activity | grep "topResumedActivity" | awk '{printf $3}' | awk -F "}" '{print $1}' # >= android 13
    exit 1
fi

if [ 2 == $# ]; then
    if [ '-s' == $1 ]; then
        adb -s $2 shell dumpsys activity | grep "mResume"            | awk '{printf $4}' | awk -F "}" '{print $1}' # <= android 12
        adb -s $2 shell dumpsys activity | grep "topResumedActivity" | awk '{printf $3}' | awk -F "}" '{print $1}' # >= android 13
        exit 1
    fi
fi

echo 'execute like this: '
echo '$ showCurrentActivity.sh'
echo 'or'
echo '$ showCurrentActivity.sh -s $device'