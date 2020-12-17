#!/bin/bash

add_date() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(date)" "$line";
    done
}

backup_count=4
log_file=~/logs/backup.log
backup_dir=~/backups
server_dir=~/server
exclusion_list=~/config/exclude_from_backup.txt

name="$(date +"%Y-%m-%d--%H--%M--%S").backup.tar.gz"

echo "Backing up server in file: $name" | add_date >> $log_file
pushd $backup_dir
echo "Removing old backups" | add_date >> $log_file
ls -t | tail -n +$backup_count | xargs -I{} sh -c "rm {}"
popd

pushd ~
echo "Backing up server..." | add_date >> $log_file
tar -cvzf $backup_dir/$name --exclude-from=$exclusion_list $server_dir
popd

echo "Done!" | add_date >> $log_file
