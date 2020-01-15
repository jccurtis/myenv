#!/usr/bin/env bash

git config --global user.email "jccurtis@lbl.gov"
git config --global user.name "Joseph Curtis"
# Change git to cache credentials for 24 hours
git config --global credential.helper 'cache --timeout=86400'
# Update git behavior to modern
git config --global push.default simple
