# Script to configure and build Stratux images with pi-gen
#!/bin/bash

arch=`uname -m`
echo "arch ${arch}"

# check out the appropriate branch to match the local architecture
# maybe pi-gen will be improved to not need this in the future
if [ "${arch}" == "arm64" ];
then
  (cd pi-gen && git checkout arm64)
else
  (cd pi-gen && git checkout master)
fi

# disable full image (stage 5), normal image (stage 4) and desktop image (stage 3)
touch pi-gen/stage3/SKIP pi-gen/stage4/SKIP pi-gen/stage5/SKIP

# and disable building the images based on the SKIPPED stages
touch pi-gen/stage3/SKIP_IMAGES pi-gen/stage4/SKIP_IMAGES pi-gen/stage5/SKIP_IMAGES

# copy the config file into place
cp config pi-gen/

# copy the stage2 files into place
cp -R stage2/ pi-gen/stage2/

# build via docker
# pass PRESERVE_CONTAINER=1 to aid in development
(cd pi-gen && ./build-docker.sh)
