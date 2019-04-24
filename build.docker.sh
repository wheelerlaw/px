#!/usr/bin/env bash

docker run -v $(pwd):/px --rm -it ubuntu bash -c '
apt-get update && apt-get install -y curl software-properties-common gnupg1 unzip git
curl -fsSL https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
dpkg --add-architecture i386
apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main"
apt-get install -y --install-recommends winehq-staging
cd px; ./build.sh
'
