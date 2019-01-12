#!/bin/bash

curCommit=$(curl --silent https://api.github.com/repos/HoveringHalibut/lflmonitor/git/refs/heads/master | jq -r '.object.sha')

if [ "$curCommit" != "$([ -f ./lastCommit ] && cat ./lastCommit)" ]; then
  git pull -q
  echo $curCommit > lastCommit
  # Use separate update script so changes are applied immediately
  ./update.sh
fi