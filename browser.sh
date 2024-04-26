#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

./devices "shell am start -a android.intent.action.VIEW -d '$1'"