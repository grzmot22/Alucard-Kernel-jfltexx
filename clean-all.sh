#!/bin/bash

LANG=C

cp -pv .config .config.bkp;
make ARCH=arm mrproper;
make clean;
cp -pv .config.bkp .config;

rm -rf ./kernel/usr;
rm -rf READY-JB/system/lib;
rm -rf READY-JB/*.zip;
rm -rf READY-JB/boot.img;

git checkout android-toolchain/

# clean ccache
read -t 5 -p "clean ccache, 5sec timeout (y/n)?";
if [ "$REPLY" == "y" ]; then
	ccache -C;
fi;
