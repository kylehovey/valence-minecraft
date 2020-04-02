#!/bin/bash

backup_dir=~/backups
backup_host="backup"
remote_backup_dir="~/friendcraft/"

pushd $backup_dir
rsync --bwlimit=200 -v -P -e ssh `ls -t | tail -n 1` $backup_host:$remote_backup_dir
popd
