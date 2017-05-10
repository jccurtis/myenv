#!/bin/env/bash

# Download the latest version of rclone.
cd && curl -O https://downloads.rclone.org/rclone-current-osx-amd64.zip

# Unzip the download and cd to the extracted folder.
unzip -a rclone-current-osx-amd64.zip && cd rclone-*-osx-amd64

# Move rclone to your $PATH. You will be prompted for your password.
sudo mv rclone /usr/local/bin/

# Remove the leftover files.
cd .. && rm -rf rclone-*-osx-amd64 rclone-current-osx-amd64.zip

# Run rclone config to setup. See rclone config docs for more details.
rclone config
