#!/bin/bash
#
# Install ansible and related packages.

# Basic linux utilities
apk add git vim util-linux pciutils usbutils coreutils binutils findutils grep
apk add openssh-client tree curl nano

# needed for mkiosfs
apk add xorriso

# ansible depend
apk add gcc libffi-dev musl-dev openssl-dev sshpass
apk add python py-pip py-crypto python-dev

# upgrade pip
pip install --upgrade pip

# Add python libraries
pip install paramiko pyyaml jinja2 httplib2 six requests dnspython
pip install bigsuds f5-sdk netmiko dnspython pysphere ciscoconfparse

# Get ansible from source
git clone https://github.com/ansible/ansible.git --branch stable-2.2 --single-branch --recursive
cd ansible
git checkout stable-2.2
git submodule update --init --recursive

# Install govc, used for vsphere VM spinup
curl -L -O https://github.com/vmware/govmomi/releases/download/v0.11.1/govc_linux_amd64.gz &&\
gunzip govc_linux_amd64.gz
mv govc_linux_amd64 /usr/local/bin/govc
chmod +x /usr/local/bin/govc

# Add NTC ansible add-ons
apk add libxml2-dev libxslt-dev zlib-dev
pip install ntc-ansible terminal
mkdir /modules && cd /modules
git clone https://github.com/networktocode/ntc-ansible --branch master --single-branch --recursive &&\
cd ntc-ansible
git submodule update --init --recursive

# Get the F5 modules from source
mkdir /vendor && cd /vendor
git clone https://github.com/F5Networks/f5-ansible.git --recursive

# Create the known_hosts and link to /dev/null (allows for many -forks)
mkdir ~/.ssh
ln -s /dev/null ~/.ssh/known_hosts

# switch to zsh
apk add zsh
curl -L http://install.ohmyz.sh | sh
echo 'source /ansible/hacking/env-setup' >> ~/.zshrc

# remove stuff we don't need in the container
apk del gcc libxml2-dev libxslt-dev libffi-dev musl-dev openssl python-dev
rm -rf /var/cache/apk/*
