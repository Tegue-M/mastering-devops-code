#!/bin/bash
# User data script for EC2 instance to install Ansible

# Set the Ubuntu codename
UBUNTU_CODENAME="jammy"

# Update package lists and install prerequisites
apt update -y

# Download the GPG key for the Ansible PPA and save it
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg

# Add the Ansible PPA to the sources list
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | tee /etc/apt/sources.list.d/ansible.list

# Update package lists again with the new repository and install Ansible
apt update -y && apt install -y ansible
