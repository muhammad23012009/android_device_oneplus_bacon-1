#!/sbin/sh

DATA_MOUNT_CODE=1

while [ "$DATA_MOUNT_CODE" != "0" ]; do
    mount -t ext4 /dev/block/by-name/userdata /data > /dev/kmsg
    DATA_MOUNT_CODE=$?
    sleep 1
done

mkdir /cache > /dev/kmsg
mkdir /data/android-data > /dev/kmsg
mkdir /data/android-data/cache > /dev/kmsg
mkdir /data/android-data/cache/recovery > /dev/kmsg
mount -o bind /data/android-data/cache /cache > /dev/kmsgs

setprop halium.datamount.done 1

exit 0

