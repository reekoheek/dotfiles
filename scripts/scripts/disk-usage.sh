#!/bin/sh

percent=$(df / | awk 'NR==2 {gsub(/%/,""); print $5}')
echo "percent|int|$percent"
echo
