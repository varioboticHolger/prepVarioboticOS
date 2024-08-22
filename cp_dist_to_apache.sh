#!/bin/bash

sudo rm -rf /var/www/varioboticOS/dist
sudo cp -r /home/$USER/tmp/dist /var/www/varioboticOS/
sudo rm -rf /var/www/varioboticOS/html_old
sudo mv /var/www/varioboticOS/html /var/www/varioboticOS/html_old
sudo mv /var/www/varioboticOS/dist /var/www/varioboticOS/html

sudo rm -rf /dist

sudo service apache2 restart
