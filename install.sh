#!/bin/bash
set -euo pipefail
 
TAILSCALE_VERSION="${TAILSCALE_VERSION:-1.102.4}"
 
apt-get -qq update
apt-get -qq install --upgrade -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  netcat-openbsd \
  wget \
  dnsutils
apt-get -qq clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
echo "+search +short" > "${HOME}/.digrc"
 
cd "${HOME}"
wget -q "https://pkgs.tailscale.com/stable/tailscale_${TAILSCALE_VERSION}_amd64.tgz"
tar xzf "tailscale_${TAILSCALE_VERSION}_amd64.tgz" --strip-components=1
rm "tailscale_${TAILSCALE_VERSION}_amd64.tgz"
 
mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale
 
echo "Tailscale ${TAILSCALE_VERSION} installed to ${HOME}"
