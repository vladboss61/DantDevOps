#!/bin/bash

# Create Users
#We can also use `adduser`` like more user-friendly.

sudo useradd dev1
sudo useradd dev2
sudo useradd dev3
sudo useradd backupdev

# Create Groups
sudo groupadd developers
sudo groupadd webmasters

# Assign Users to Groups
sudo usermod -aG developers dev1
sudo usermod -aG developers dev2
sudo usermod -aG webmasters dev3

# Set Default Group for Users
sudo usermod -g developers dev1
sudo usermod -g developers dev2

# Create Home Directories
mkdir /home/dev1
mkdir /home/dev2
mkdir /home/dev3
mkdir /home/backupdev

# Copy a User dev1 to new file /home/backupdev
#We can also use cp, but i like rsync.
sudo rsync -a /home/dev1/ /home/backupdev/

# Set Permissions for a Shared Project
mkdir /home/web_project
sudo chgrp developers /home/web_project
sudo chmod g+rw /home/web_project

# Immutable log file
touch /home/my.log
sudo chmod 644 /home/my.log
sudo chattr +a /home/my.log

sudo chmod +t /home/test_user1 # just for testing sticky bit
