#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

path="/sdcard/capture.pcap"
echo "start tcpdump, pcap file will be saved in $path"
sadb shell tcpdump -i any -w "$path" # 默认 262144 bytes