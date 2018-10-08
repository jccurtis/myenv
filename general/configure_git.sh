#!/usr/bin/env bash

git config --global user.email "jccurtis@lbl.gov"
git config --global user.name "Joseph Curtis"
git config credential.helper 'cache --timeout=86400'  # 24 hours
