#!/bin/bash

apk --update add tzdata
cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
apk del tzdata
rm -rf /var/cache/apk/* 

apk add mariadb-dev
apk add mariadb-client

apk add curl

mount -t cifs ${NAS_PATH} /mnt/nas -o username=${NAS_USER},password=${NAS_PASS},iocharset=utf8,rw,uid=0,gid=0

/usr/sbin/crond
crontab /home/root/crontab_setting

