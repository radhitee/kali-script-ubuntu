#!/bin/bash

# Welcome message
echo "----------------------------------------"
echo "  Welcome to Kali Linux Setup Script    "
echo "      Powered by Radhitee               "
echo "----------------------------------------"

# Install gnupg
sudo apt update
sudo apt install gnupg -y

# Add Kali Linux repository key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6

# Add Kali Linux repository to sources.list
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list.d/kali.list
