#!/bin/bash

# Welcome message
echo "----------------------------------------"
echo "  Welcome to Kali Linux Setup Script    "
echo "      Powered by Radhitee               "
echo "----------------------------------------"

echo "# Creating virtual env for python"
sudo apt install python3.11-venv
python3 -m venv /usr/local/venv
export PATH="/usr/local/venv/bin:$PATH"
echo $0

echo "# Install ParamSpider"
#git clone https://github.com/devanshbatham/paramspider
cd paramspider
pip install .
