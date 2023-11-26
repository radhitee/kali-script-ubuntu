#!/bin/bash

# Welcome message
echo "----------------------------------------"
echo "  Welcome to Kali Linux Setup Script    "
echo "      Powered by Radhitee               "
echo "----------------------------------------"

# Update package lists
sudo apt update

# Install dependencies
sudo apt install -y curl gpg
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm autolibs disable
rvm requirements
rvm install 3.0.5
rvm use 3.0.5 --default
gem install bundler

# Clone Metasploit repository
git clone https://github.com/rapid7/metasploit-framework.git
cd metasploit-framework

# Install Metasploit dependencies
sudo apt install -y build-essential libpq-dev libpcap-dev

# Install Metasploit
bundle install

# Add Metasploit to PATH
echo 'export PATH=$PATH:$HOME/metasploit-framework' >> ~/.bashrc
source ~/.bashrc

# Finish installation
echo "Metasploit has been installed successfully."
echo "You can now start Metasploit by running 'msfconsole'."
