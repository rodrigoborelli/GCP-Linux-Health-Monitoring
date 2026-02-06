#!/bin/bash
# Script: linux_user_group_mgmt.sh
# Purpose: Practice basic user/group management on Linux

# Create a group named 'sre'
sudo groupadd sre

# Create a user named 'rodrigo' and add to 'sre' group
sudo useradd -m -G sre rodrigo

# Set password for the new user (interactive)
echo "Set password for 'rodrigo':"
sudo passwd rodrigo

# List all users and groups
echo "Current users:"
cut -d: -f1 /etc/passwd | sort | head -n 10
echo "Current groups:"
cut -d: -f1 /etc/group | sort | head -n 10

# Remove user (example)
# sudo deluser rodrigo 

# Remove group (example)
# sudo groupdel sre 

echo "Check file permissions:"
ls -l /home/rodrigo/

echo "Add another user 'alice' to existing group 'sre':"
sudo useradd -m alice
sudo usermod -aG sre alice

echo "Done! See README.md for more notes."
