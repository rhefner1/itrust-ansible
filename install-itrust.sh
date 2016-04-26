#!/usr/bin/env bash

# Install python-pip and Ansible binary dependencies. Then use pip to install Ansible.
if type "dnf" &> /dev/null ; then
  sudo dnf install -y python-pip gcc python-devel redhat-rpm-config python-dnf
  sudo pip install --upgrade ansible
elif type "yum" &> /dev/null ; then
  sudo yum install -y python-pip gcc python-devel redhat-rpm-config epel-release
  sudo pip install --upgrade ansible
elif type "apt-get" &> /dev/null ; then
  sudo apt-get update
  sudo apt-get install -y python-pip
  sudo pip install --upgrade ansible
fi

read -p "Have you added an SSH key to clone iTrust with git? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
  ansible-playbook -i hosts dev.yml --ask-sudo-pass -v
else
  echo "Run ssh-keygen to create your SSH key and add that to your git host."
  echo "Then run this setup again."
fi
