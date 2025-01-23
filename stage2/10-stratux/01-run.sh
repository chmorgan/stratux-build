#!/bin/bash -e

git clone -b pong-support https://github.com/jamez70/stratux.git

# install packages as part of the run portion of the script
# as they are necessary for the build.
#
# xx-packages will install to the PI so its not appropriate for build required packages
apt update
apt install -y make gcc ncurses-dev librtlsdr-dev pkg-config golang

(cd stratux && git submodule update --init --recursive)

(cd stratux && make)
