#!/usr/bin/env bash
#
# id: bash_install_dokku
# description: Install Dokku using Debian package in an idempotent way
#
# Resources
# - Dokku Debian Package Installation Notes
#   https://github.com/dokku/dokku/blob/master/docs/getting-started/install/debian.md
#

set -e

self=${0##*/}
log() {
  echo "== $self $1"
}

DOKKU_VERSION="$1"
DOKKU_HOSTNAME="$2"
log "DOKKU_VERSION=$DOKKU_VERSION"
log "DOKKU_HOSTNAME=$DOKKU_HOSTNAME"

log "Install prerequisites ..."
sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y apt-transport-https

log "Install docker ..."
wget -nv -O - https://get.docker.com/ | sh

log "Prepare dokku installation ..."
wget -nv -O - https://packagecloud.io/dokku/dokku/gpgkey | apt-key add -
OS_ID="$(lsb_release -cs 2>/dev/null || echo "trusty")"
echo "trusty utopic vivid wily xenial yakkety zesty artful bionic" | grep -q "$OS_ID" || OS_ID="trusty"
echo "deb https://packagecloud.io/dokku/dokku/ubuntu/ ${OS_ID} main" | sudo tee /etc/apt/sources.list.d/dokku.list
sudo apt-get update -qq >/dev/null

log "Setting options for unattended install ..."
echo "dokku dokku/vhost_enable boolean true" | sudo debconf-set-selections
echo "dokku dokku/web_config boolean false" | sudo debconf-set-selections
echo "dokku dokku/hostname string $DOKKU_HOSTNAME" | sudo debconf-set-selections
echo "dokku dokku/skip_key_file boolean false" | sudo debconf-set-selections
echo "dokku dokku/key_file string $HOME/.ssh/authorized_keys" | sudo debconf-set-selections
echo "dokku dokku/nginx_enable boolean true" | sudo debconf-set-selections

log "Install dokku ..."
sudo apt-get install -qq -y dokku=$DOKKU_VERSION
sudo dokku plugin:install-dependencies --core
