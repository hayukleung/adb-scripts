#!/bin/bash

# go to directory of command
# cd "$(dirname "$0")"

showCurrentActivity | awk -F '/' '{print $1}'