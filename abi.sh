#!/bin/bash

# go to directory of command
cd "$(dirname "$0")"

./devices "shell getprop ro.product.cpu.abi"
