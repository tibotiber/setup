#!/bin/sh
# Install Nginx
sudo apt-get update
sudo apt-get install -y nginx
sudo update-rc.d nginx defaults
