#!/bin/bash

# Apply device-specific patches

OLD_WD=$(pwd)
DEVICE_PATH=device/oneplus/bacon/patches

for patch in `find $DEVICE_PATH -name *.patch | sort | awk -F $DEVICE_PATH '{print $2}'`; do
    cd $OLD_WD/./$(dirname $patch)
    if patch -p1 -N --dry-run --silent < $OLD_WD/$DEVICE_PATH/$patch 2>/dev/null; then
        patch -p1 < $OLD_WD/$DEVICE_PATH/$patch
    fi
done
