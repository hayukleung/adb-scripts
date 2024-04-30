#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

sadb shell am start -a android.intent.action.VIEW -d $1