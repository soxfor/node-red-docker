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
      if [[ "$1" != "depends" ]]; then
        install_node-red-contrib-db2-fixed
      else
        install_node-red-contrib-db2-fixed_depends
      fi
      ;;
    "zlib")
      if [[ "$1" != "depends" ]]; then 
        npm install --unsafe-perm --no-cache --only=production zlib 
      fi
      ;;
    "fs")
      if [[ "$1" != "depends" ]]; then 
        npm install --unsafe-perm --no-cache --only=production fs
      fi
      ;;
    "btoa")
      if [[ "$1" != "depends" ]]; then 
        npm install --unsafe-perm --no-cache --only=production btoa
      fi
      ;;
    *)
      printf "Skip installing extra Nodes\n"
      ;;
  esac
done
unset IFS
