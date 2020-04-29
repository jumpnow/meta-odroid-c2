#!/bin/bash

MACHINE=odroid-c2

if [ "x${1}" = "x" ]; then
    echo "Usage: ${0} <block device>"
    exit 0
fi

mount | grep '^/' | grep -q ${1}

if [ $? -ne 1 ]; then
    echo "Looks like partitions on device /dev/${1} are mounted"
    echo "Not going to work on a device that is currently in use"
    mount | grep ${1}
    exit 1
fi

if [ -b ${1} ]; then
    DEV=${1}
elif [ -b "/dev/${1}" ]; then
    DEV=/dev/${1}
else
    echo "Block device not found: /dev/${1}"
    exit 1
fi

grep -q [1-9] <(echo $DEV)

if [ $? -eq 0 ]; then
   echo "Block device should not have a partition: $DEV"
   exit 1
fi

echo "MACHINE: $MACHINE"

if [ -z "$OETMP" ]; then
    # echo try to find it
    if [ -f ../../build/conf/local.conf ]; then
        OETMP=$(grep '^TMPDIR' ../../build/conf/local.conf | awk '{ print $3 }' | sed 's/"//g')
    fi
fi

if [ -z "$OETMP" ]; then
    echo "Environment variable OETMP not set"
    exit 1
else
    echo "OETMP: $OETMP"

    if [ ! -d ${OETMP}/deploy/images/${MACHINE} ]; then
        echo "Directory not found: ${OETMP}/deploy/images/${MACHINE}"
        exit 1
    fi

    SRC=${OETMP}/deploy/images/${MACHINE}
fi 

if [ ! -d /media/card ]; then
    echo "Temporary mount point [/media/card] not found"
    exit 1
fi

if [ ! -f ${SRC}/bl1.bin.hardkernel ]; then
    echo "File not found: ${SRC}/bl1.bin.hardkernel"
    exit 1
fi

if [ ! -f ${SRC}/u-boot-${MACHINE}.bin ]; then
    echo "File not found: ${SRC}/u-boot-${MACHINE}.img"
    exit 1
fi

echo "Using dd to copy bl1.bin.hardkernel to unpartitioned space"
sudo dd if=${SRC}/bl1.bin.hardkernel of=${DEV} conv=notrunc bs=1 count=442
sudo dd if=${SRC}/bl1.bin.hardkernel of=${DEV} conv=notrunc bs=512 skip=1 seek=1

echo "Using dd to copy u-boot to unpartitioned space"
sudo dd if=${SRC}/u-boot-${MACHINE}.bin of=${DEV} conv=notrunc bs=512 seek=97

echo "Done"
