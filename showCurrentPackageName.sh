#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

showCurrentActivity.sh | awk -F '/' '{print $1}'