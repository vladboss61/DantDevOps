#!/bin/bash

# Create User Accounts
useradd dev1
useradd dev2
useradd dev3
useradd backupdev

# Create Groups
groupadd developers
groupadd webmasters

# Assign Users to Groups
usermod -aG developers dev1
usermod -aG developers dev2
usermod -aG webmasters dev3

# Set Default Group for Users
usermod -g developers dev1
usermod -g developers dev2

# Create Home Directories
mkdir /home/dev1
mkdir /home/dev2
mkdir /home/dev3
mkdir /home/backupdev

# Clone a User Account
rsync -a /home/dev1/ /home/backupdev/

# Set Permissions for a Shared Project
mkdir /home/web_project
chgrp developers /home/web_project
chmod g+rw /home/web_project

# Immutable log file
touch /home/my.log
chmod 644 /home/my.log
chattr +a /home/my.log
