#!/bin/bash


pushd ../rpi64-build/tmp/deploy/images/raspberrypi4-64
mkdir temp
cd temp
tar xf ../core-image-base-raspberrypi4-64.tar.bz2
echo "WE ARE NOW AT THE NEW FS"
du -s -h
PS1=">> " bash --norc
cd /home/chris/yocto/rpi64-build/tmp/deploy/images/raspberrypi4-64
rm -rf temp/
popd

