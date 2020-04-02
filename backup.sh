#!/bin/bash

cd ~/backups/
name="$(date +"%Y-%m-%d--%H--%M--%S").backup.zip"
echo "Removing old backups"
ls -t | tail -n +5 | xargs rm --
echo "Backing up server..."
zip $name -rv ../server
echo "Backed up server in zipfile: $name"
