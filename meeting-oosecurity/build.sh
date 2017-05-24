#!/bin/bash

# Make sure the script exits on first error
set -e

RED="$(echo -e '\033[1;31m')"
NORM="$(echo -e '\033[0m')"

function handle_err() {
  echo -e "\n${RED}ERROR: build script failed.${NORM}\n"
}

trap handle_err ERR


sudo echo -e "\nTesting sudo works...\n"

# We MUST be in the same directory as this script for the build to work properly
cd $(dirname $0)

# Build ourselves
echo
echo "Building meeting-oosecurity..."

sudo time docker build $@ -t meeting-oosecurity .
sudo docker tag meeting-oosecurity oosecurity/meeting:latest
