#!/sbin/sh

DATA_MOUNT_CODE=1

RETRY_COUNTER=0
while [ "$DATA_MOUNT_CODE" != "0" ]; do
    if [ "$RETRY_COUNTER" -gt "3" ]; then
        echo "setup_fake_cache.sh - reached maximum number of retries" > /dev/kmsg

        setprop halium.datamount.done 1
        exit 1
    fi
    RETRY_COUNTER=$((RETRY_COUNTER+1))

    mount /dev/block/by-name/userdata /data > /dev/kmsg
    DATA_MOUNT_CODE=$?
done

mkdir /data/cache/ > /dev/kmsg
mkdir /data/cache/recovery/ > /dev/kmsg

while [ "$DATA_MOUNT_CODE" == "0" ]; do
    if [ ! -d /cache/recovery ]; then
        mount --bind /data/cache /cache > /dev/kmsg
    fi
done

setprop halium.datamount.done 1
exit 0
