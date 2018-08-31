#!/bin/env/bash

# From https://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.6 python3.6-venv

# Install pip3.6
curl https://bootstrap.pypa.io/get-pip.py | sudo python3.6
