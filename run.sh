#!/bin/bash
set -uo pipefail
 
cd "${HOME}"
 
while true; do
  ./tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055
  sleep 1
done &
 
while true; do
  ./tailscale up --hostname=vpn-panda --advertise-exit-node
  sleep 1
done &

while true; do
  ./tailscale web --listen 0.0.0.0:2521
  sleep 1
done &
 
sleep infinity
