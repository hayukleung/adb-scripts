#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

devices=$(adb devices | grep -E 'device$' | awk -F ' ' '{print $1}')

echo "> choose your device: "
echo ""
 
select opt in $devices "exit"; do
    case $opt in
    "exit")
        echo ""
        echo "> exit"
        break
        ;;
    *)
        if [ -z $opt ]; then
            echo ""
            echo "> unknown option $REPLY"
            break
        fi
        echo ""
        echo "> you choose the device: $opt"
        adb -s "$opt" shell screencap -p sdcard/screen.png
        if [ ! -d $1 ]; then
            mkdir -p $1
        fi
        adb -s "$opt" pull sdcard/screen.png $1 
        break
        ;;    
    esac
done
