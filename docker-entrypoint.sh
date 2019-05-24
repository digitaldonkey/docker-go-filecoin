#!/bin/sh
set -e

echo "WELCOME TO FILECOIN RUNNER"

# Group 'filecoin'
if [ id -g filecoin 2> /dev/null -eq 0 ]; then
    echo "INFO: User filecoin Found"
else
    echo "INFO: Add group 'filecoin'" && \
    addgroup filecoin
fi

# $HOME directory for 'filecoin' user
#
# Must be a persistent directory
#
# Never add this to your Docker image.
# You might publish PRIVATE KEYS with the Docker Image.
#
if [ ! -d "/data/filecoin" ]; then
    echo "INFO: Create directory /data/filecoin"
    mkdir -p /data/filecoin
    chmod 770 /data/filecoin
    touch /data/filecoin/TEST # `date '+%Y-%m-%d %H:%M:%S'`
fi

# User 'filecoin'
if [ id -u filecoin 2> /dev/null -eq 0 ]; then
    echo "User filecoin Found"
else
    echo "INFO: Add user 'filecoin'" && \
    adduser -D -h /data/filecoin -u 1000 -G filecoin filecoin && \
    chown root:filecoin /data/filecoin
fi

/usr/local/bin/start_filecoin

# exit 0
