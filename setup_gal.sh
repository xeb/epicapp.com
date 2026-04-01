#!/bin/bash
# Setup nginx + certbot for epicapp.com on gal.xeb.ai
# Run with: sudo bash setup_gal.sh

set -e

DOMAIN="epicapp.com"
WWW_DOMAIN="www.epicapp.com"
ROOT="/home/xeb/p/epicapp.com"

echo "=== Setting up $DOMAIN ==="

# Create nginx config
cat > /etc/nginx/sites-available/$DOMAIN << 'NGINX'
server {
    listen 80;
    server_name epicapp.com www.epicapp.com;
    root /home/xeb/p/epicapp.com;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
NGINX

# Enable site
ln -sf /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/$DOMAIN

# Test config
nginx -t

# Reload nginx
systemctl reload nginx

echo "=== Nginx configured ==="
echo "=== Running certbot for SSL ==="

# Get SSL cert
certbot --nginx -d $DOMAIN -d $WWW_DOMAIN --non-interactive --agree-tos --email xebxeb@gmail.com

echo "=== Done! ==="
echo "Site is live at https://$DOMAIN"
