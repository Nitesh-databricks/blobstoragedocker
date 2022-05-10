#!/bin/bash

echo "user_allow_other" >> /etc/fuse.conf
mkdir -p /mnt/blobfusetmp
chown root /mnt/blobfusetmp
mkdir ${AZURE_MOUNT_POINT}

blobfuse ${AZURE_MOUNT_POINT} --use-https=true --tmp-path=/mnt/blobfusetmp/${AZURE_STORAGE_ACCOUNT} --container-name=${AZURE_STORAGE_ACCOUNT_CONTAINER} --basic-remount-check=true -o allow_other -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120
status=$?
echo "setup complete - $status"