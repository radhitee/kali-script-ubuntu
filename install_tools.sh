#!/bin/bash

# Welcome message
echo "----------------------------------------"
echo "  Welcome to Kali Linux Setup Script    "
echo "      Powered by Radhitee               "
echo "----------------------------------------"

echo "# Install gnupg"
sudo apt update && apt upgrade -y
sudo apt install gnupg -y

echo "# Add Kali Linux repository key"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6

echo "# Add Kali Linux repository to sources.list"
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list.d/kali.list

echo "# Install required packages"
sudo apt update && apt upgrade -y
sudo apt --fix-broken install -y
sudo apt install nmap sqlmap subfinder httpx-toolkit python3-pip dirsearch golang-go slowhttptest screen -y

echo "# Install Nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo cp /root/go/bin/nuclei /usr/bin/
nuclei

echo "# Install DalFox"
go install github.com/hahwul/dalfox/v2@latest
sudo cp /root/go/bin/dalfox /usr/bin/

echo "# Install ParamSpider"
git clone https://github.com/devanshbatham/paramspider
cd paramspider
pip install .
