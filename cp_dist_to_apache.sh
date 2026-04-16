#!/bin/bash

# Script execution continues even if errors occur
set +e

# Determine the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure target directory exists
sudo mkdir -p /var/www/varioboticOS

# Remove old backup if it exists
sudo rm -rf /var/www/varioboticOS/html_old

# Backup the current html folder if it exists
if [ -d "/var/www/varioboticOS/html" ]; then
    sudo mv /var/www/varioboticOS/html /var/www/varioboticOS/html_old
fi

# Move the dist folder from the script directory to the target location and rename to html
if [ -d "$SCRIPT_DIR/dist" ]; then
    sudo mv "$SCRIPT_DIR/dist" /var/www/varioboticOS/html
else
    echo "Warning: No 'dist' folder found in $SCRIPT_DIR Nothing was moved."
fi

# Clean up temp dist if it exists at root (from old script logic)
sudo rm -rf /dist

sudo service apache2 restart
