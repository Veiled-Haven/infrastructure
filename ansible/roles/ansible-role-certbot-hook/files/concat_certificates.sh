#!/bin/bash

# Create the HAProxy SSL directory if it does not exist
mkdir -p /etc/haproxy/ssl
for domain in /etc/letsencrypt/live/*; do
  cat "${domain}/fullchain.pem" "${domain}/cert.pem" "${domain}/privkey.pem" > "/etc/haproxy/ssl/$(basename "${domain}").pem"
done
rm /etc/letsencrypt/live/README.md /etc/haproxy/ssl/README.pem

# Inform the user
echo "All certificates have been concatenated and copied to $HAPROXY_SSL_DIR"
echo "restarting haproxy"
haproxy -c -f /etc/haproxy/haproxy.cfg && systemctl restart haproxy.service
