#!/bin/sh

[ -e libancillary/ancillary.h ] || git submodule update --init libancillary || exit 1

mkdir -p output
mkdir -p output/aarch64
mkdir -p output/armhf
mkdir -p output/amd64
mkdir -p output/i386

/usr/bin/aarch64-linux-gnu-gcc -shared -fpic -std=gnu99 -Wall *.c -I . -I libancillary \
-o output/aarch64/libandroid-shmem.so -Wl,--version-script=exports.txt -lc -lpthread && \
/usr/bin/aarch64-linux-gnu-strip output/aarch64/libandroid-shmem.so

/usr/bin/arm-linux-gnueabihf-gcc -shared -fpic -std=gnu99 -Wall *.c -I . -I libancillary \
-o output/armhf/libandroid-shmem.so -Wl,--version-script=exports.txt -lc -lpthread && \
/usr/bin/arm-linux-gnueabihf-strip output/armhf/libandroid-shmem.so

/usr/bin/x86_64-linux-gnu-gcc -shared -fpic -std=gnu99 -Wall *.c -I . -I libancillary \
-o output/amd64/libandroid-shmem.so -Wl,--version-script=exports.txt -lc -lpthread && \
/usr/bin/x86_64-linux-gnu-strip output/amd64/libandroid-shmem.so

/usr/bin/i686-linux-gnu-gcc -shared -fpic -std=gnu99 -Wall *.c -I . -I libancillary \
-o output/i386/libandroid-shmem.so -Wl,--version-script=exports.txt -lc -lpthread && \
/usr/bin/i686-linux-gnu-strip output/i386/libandroid-shmem.so
