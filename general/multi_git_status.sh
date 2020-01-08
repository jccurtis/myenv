#!/usr/bin/env bash

curl -s -o mgitstatus https://raw.githubusercontent.com/fboender/multi-git-status/master/mgitstatus
chmod 755 mgitstatus
sudo rm -f /usr/local/bin/mgitstatus
sudo mv mgitstatus /usr/local/bin/