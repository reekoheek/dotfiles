#!/bin/sh

# Total memory usage (RAM + all swap) in GB
used=$(free -b | awk '/^Mem:/ {ram=$3} /^Swap:/ {swap=$3} END {printf "%.0f", (ram+swap)/1024/1024/1024}')

echo "used|int|$used"
echo
