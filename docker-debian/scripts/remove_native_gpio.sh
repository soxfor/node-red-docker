#!/usr/bin/env bash
set -ex

# Remove native GPIO node if exists
if [[ -d "/usr/src/node-red/node_modules/@node-red/nodes/core/hardware" ]]; then
  printf "Removing native GPIO node\n"
  rm -r /usr/src/node-red/node_modules/@node-red/nodes/core/hardware
else
  printf "Skip removing native GPIO node\n"
fi

