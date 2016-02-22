#!/bin/sh

set -ex

apk add --update-cache privoxy

chown -R root:root /var/log/privoxy /etc/privoxy

chmod 0700 /var/log/privoxy

mkdir -p /usr/local/share

chown root:root /usr/local/share

tar --create --file - --directory /etc privoxy | tar --extract --file - --directory /usr/local/share
