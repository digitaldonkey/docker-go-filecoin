#!/bin/sh
set -e

echo "FILECOIN_PATH=$FILECOIN_PATH"

# Group 'filecoin'
if [ egrep -i "^filecoin" /etc/group 2> /dev/null -eq 0 ]; then
    echo "Found Group 'filecoin'"
else
    echo "Adding group 'filecoin'" && \
    addgroup filecoin
fi

# $HOME directory for 'filecoin' user
#
# Must be a persistent directory
#
# Never add this to your Docker image.
# You might publish PRIVATE KEYS with the Docker Image.
#
if [ -d "$FILECOIN_PATH" ]; then
    echo "Found directory $FILECOIN_PATH"
else
    echo "Creating directory $FILECOIN_PATH"
    mkdir -p $FILECOIN_PATH
    chmod 770 $FILECOIN_PATH
fi

# User 'filecoin'
if [ id -u filecoin 2> /dev/null -eq 0 ]; then
    echo "Found user 'filecoin'"
else
    echo "Adding User 'filecoin'" && \
    adduser -D -h $FILECOIN_PATH -u 1000 -G filecoin filecoin && \
    chown root:filecoin $FILECOIN_PATH
fi

if [ -f "$FILECOIN_PATH/config.json" ]; then
    cat $FILECOIN_PATH/config.json
fi

# Start demon
# @see go-filecoin/bin/container_daemon === /usr/local/bin/start_filecoin
# su filecoin is ensured in startup script.
echo "Starting container_daemon" && \
/usr/local/bin/start_filecoin

# exit 0
