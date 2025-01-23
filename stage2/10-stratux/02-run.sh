#!/bin/bash -e
# install stratux to the appropriate location in the root filesystem

(cd stratux && export STRATUX_HOME=${ROOTFS_DIR}/opt/stratux && make install)
