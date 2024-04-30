#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

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
        
        packageName=$(adb -s "$opt" shell dumpsys activity | grep "mResume" | awk '{printf $4}' | awk -F "}" '{print $1}' | awk -F '/' '{print $1}') 
        
        if [ -z $packageName ]; then
            packageName=$(adb -s "$opt" shell dumpsys activity | grep "topResumedActivity" | awk '{printf $3}' | awk -F "}" '{print $1}' | awk -F '/' '{print $1}')
        fi

        if [ ! -e $1 ]; then
            mkdir -p $1
        fi
        if [ ! -d $1 ]; then
            echo "$1 is not a directory, please change your target path"
            break
        fi
        adb -s "$opt" pull $(adb -s "$opt" shell pm path $packageName | awk -F "package:" '{print $2}') $1

        break
        ;;    
    esac
done

# echo 'execute like this: '
# echo '$ exportAPK.sh $targetPath'