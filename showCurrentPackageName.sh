#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

if [ 0 == $# ]; then
    ./showCurrentActivity.sh | awk -F '/' '{print $1}'
    exit 1
fi

if [ 2 == $# ]; then
    if [ '-s' == $1 ]; then
        ./showCurrentActivity.sh $1 $2 | awk -F '/' '{print $1}'
        exit 1
    fi
fi

echo 'execute like this: '
echo '$ showCurrentPackageName.sh'
echo 'or'
echo '$ showCurrentPackageName.sh -s $device'