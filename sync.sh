#!/bin/bash

add_date() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(date)" "$line";
    done
}

backup_dir=~/backups
log_file=~/logs/sync.log
backup_host="backup"
remote_backup_dir="~/friendcraft/"
t_stamp="$(date +"%Y-%m-%d--%H--%M--%S")"

pushd $backup_dir
echo "Starting rsync job: sending backup to server" | add_date >> $log_file
file=`ls -t | tail -n 1`
echo "Sending $file" | add_date >> $log_file
rsync --bwlimit=200 -v -P -e ssh $file  $backup_host:$remote_backup_dir
echo "done." | add_date >> $log_file
popd
