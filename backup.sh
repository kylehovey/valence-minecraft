#!/bin/bash

cd ~/backups/
name="$(date +"%Y-%m-%d--%H--%M--%S").backup.tar.gz"
echo "Removing old backups"
ls -t | tail -n +5 | xargs rm --
echo "Backing up server..."
pushd ~
tar -cvzf backups/$name --exclude='server/plugins/*' server
popd
echo "Backed up server in file: $name"
