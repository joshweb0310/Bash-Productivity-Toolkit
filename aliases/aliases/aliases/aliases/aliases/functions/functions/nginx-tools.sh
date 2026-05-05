#!/usr/bin/env bash
# -----------------------------------------
# Nginx Tools — BPT Module
# -----------------------------------------
# Helper functions for managing Nginx:
# config validation, reloads, site
# management, and log inspection.
# -----------------------------------------

# --- Validate Nginx configuration ---
nginx-validate() {
    echo "Validating Nginx configuration..."
    sudo nginx -t
}

# --- Reload Nginx safely ---
nginx-safe-reload() {
    echo "Checking config before reload..."
    if sudo nginx -t; then
        echo "Config OK — reloading..."
        sudo systemctl reload nginx
    else
        echo "Config invalid — reload aborted."
        return 1
    fi
}

# --- Restart Nginx safely ---
nginx-safe-restart() {
    echo "Checking config before restart..."
    if sudo nginx -t; then
        echo "Config OK — restarting..."
        sudo systemctl restart nginx
    else
        echo "Config invalid — restart aborted."
        return 1
    fi
}

# --- Enable a site (symlink to sites-enabled) ---
nginx-enable() {
    if [ -z "$1" ]; then
        echo "Usage: nginx-enable <site.conf>"
        return 1
    fi

    sudo ln -s /etc/nginx/sites-available/"$1" /etc/nginx/sites-enabled/"$1" 2>/dev/null
    echo "Enabled: $1"
    nginx-safe-reload
}

# --- Disable a site ---
nginx-disable() {
    if [ -z "$1" ]; then
        echo "Usage: nginx-disable <site.conf>"
        return 1
    fi

    sudo rm -f /etc/nginx/sites-enabled/"$1"
    echo "Disabled: $1"
    nginx-safe-reload
}

# --- View Nginx error log ---
nginx-errors() {
    sudo tail -f /var/log/nginx/error.log
}

# --- View Nginx access log ---
nginx-access() {
    sudo tail -f /var/log/nginx/access.log
}
