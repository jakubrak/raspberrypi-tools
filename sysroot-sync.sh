#!/bin/sh

# check if number of mandatory args is correct
if [ "$#" -ne 1 ]; then
    echo Usage: `basename "$0"` SYSROOT_DIR
    exit 1
fi

SYSROOT_DIR=$1

# check if directory exists
if [ ! -d "${SYSROOT_DIR}" ]; then
    echo ${SYSROOT_DIR} does not exist!
    exit 1
fi

echo ${SYSROOT_DIR}

rsync -avzL pi@raspberrypi.local:/lib ${SYSROOT_DIR}
rsync -avzL pi@raspberrypi.local:/usr/include ${SYSROOT_DIR}/usr
rsync -avzL pi@raspberrypi.local:/usr/lib ${SYSROOT_DIR}/usr
rsync -avzL pi@raspberrypi.local:/opt/vc ${SYSROOT_DIR}/opt
