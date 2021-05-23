#!/bin/bash
set -ex
chmod 777 -R ./node_modules /bundle

if [[ -z $HOST_USER || -z $HOST_UID || -z $HOST_GID ]]; then
  exec "$@"
else
  groupadd $HOST_USER -g $HOST_GID \
  && groupadd wheel \
  && useradd $HOST_USER -u $HOST_UID -g $HOST_GID \
  && usermod -aG wheel $HOST_USER \
  && mkdir /home/$HOST_USER \
  && chown -R $HOST_USER /home/$HOST_USER \
  && echo "%wheel ALL=NOPASSWD: ALL" >> /etc/sudoers
  exec /usr/sbin/gosu $HOST_USER "$@"
fi
