#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

# adb shell am start -a android.intent.action.VIEW -d "https://m.leyaoyao.com/pages/subSuperDbj/index.html"
sadb.sh shell am start -a android.intent.action.VIEW -d $1