#!/usr/bin/env bash
set -ex

install_build-tools() {
  printf "Installing build-tools\n"
  apt-get -y install build-essential make linux-headers-amd64 udev python python3
}

case "${TAG_SUFFIX}" in
  "default")
    install_build-tools
    ;;
  "minimal")
    printf "Skip installing build-tools\n"
    ;;
  *)
    install_build-tools
    ;;
esac
