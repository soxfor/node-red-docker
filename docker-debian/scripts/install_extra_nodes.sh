#!/usr/bin/env bash
set -ex

install_node-red-contrib-db2-fixed_depends () {
    printf "Installing Node node-red-contirb-db2-fixed dependencies\n"
    apt-get -y install libxml2
}

install_node-red-contrib-db2-fixed () {
  printf "Installing Node node-red-contrib-db2-fixed\n"
  install_node-red-contrib-db2-fixed_depends
  npm install --unsafe-perm --no-cache --only=production github:soxfor/node-red-contrib-db2-fixed
}

IFS=$','
for node in ${NODES}; do
  case "${node}" in
    "ibm_db")
      if [[ "$1" = "depends" ]]; then
        install_node-red-contrib-db2-fixed_depends
      else
        install_node-red-contrib-db2-fixed
      fi
      ;;
    "zlib")
      npm install --unsafe-perm --no-cache --only=production zlib
      ;;
    "fs")
      npm install --unsafe-perm --no-cache --only=production fs
      ;;
    "btoa")
      npm install --unsafe-perm --no-cache --only=production btoa
      ;;
    *)
      printf "Skip installing extra Nodes\n"
      ;;
  esac
done
unset IFS
