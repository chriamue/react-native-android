#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user
chown $USER_ID:$USER_ID $HOME
echo y | android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}"
echo y | android update sdk --no-ui --all --filter "${GOOGLE_COMPONENTS}"

exec /usr/local/bin/gosu user "$@"
