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
        adb -s "$opt" "$@"
        break
        ;;    
    esac
done


# echo 'execute like this: '
# echo '$ devices $command'