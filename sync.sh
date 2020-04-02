#!/bin/bash

backup_dir=~/backups
bandwith_limit_kbps=200
backup_host="backup"
remote_backup_dir="~/friendcraft/"

pushd $backup_dir
rsync --bwlimit=200 -v -P -e ssh `ls -t | tail -n 1` $backup_host:$remote_backup_dir
popd
