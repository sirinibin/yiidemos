#!/bin/sh
# update & install basic packages #
# Created by Amit Karwal #
##########################################################

# Update package repos
sudo apt-get update

# Install nginx webserver
sudo apt-get install nginx-full -y

# Install php5
sudo apt-get install php5 -y

# Install php5-fpm to support nginx with php
sudo apt-get install php5-fpm -y

# Install munin monitoring server
sudo apt-get install munin -y 

# Install munin node
sudo apt-get install munin-node -y


# Install mysql server with predefined password (lgd#*92RS), Change it what you like.
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password password lgd#*92RS'
sudo debconf-set-selections <<< 'mysql-server-5.1 mysql-server/root_password_again password lgd#*92RS'
sudo apt-get -y install mysql-server

#Stop Apache Server
sudo service apache2 stop

