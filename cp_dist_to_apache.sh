#!/bin/bash

sudo rm -rf /var/www/varioboticOS/dist
sudo cp -r ~/tmp/dist /var/www/varioboticOS/
sudo rm -rf /var/www/varioboticOS/html_old
sudo mv /var/www/varioboticOS/html /var/www/varioboticOS/html_old
sudo mv /var/www/varioboticOS/dist /var/www/varioboticOS/html

sudo systemctl restart apache2.service
