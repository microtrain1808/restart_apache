#!/bin/bash

CONFIG="$1"
COMMAND="$2"

if [ "$#" -ne 2 ]
then
    echo "$0 requires two parameters {virtual-host} {restart|reload}"
    exit 1
fi

cd /etc/apache2/sites-available

# Disable VHOSTS
sudo a2dissite "$CONFIG"
sudo systemctl "$COMMAND" apache2

# Enable VHOSTS
sudo a2ensite "$CONFIG"
sudo systemctl "$COMMAND" apache2