#!/usr/bin/env bash

set -e

expandenv /defaults/pritunl.conf > /etc/pritunl-custom.conf && \

mkdir --parents /config/pritunl/keystore /config/pritunl/log
chmod --recursive 0777 /config/pritunl
chown --recursive system:system /config/pritunl
