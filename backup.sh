#!/bin/bash

backup_count=5
backup_dir=backups
server_dir=server
exclusion_list=config/exclude_from_backup.txt

name="$(date +"%Y-%m-%d--%H--%M--%S").backup.tar.gz"

pushd $backup_dir
echo "Removing old backups"
ls -t | tail -n +$backup_count | xargs -I{} sh -c "rm {}"
popd

pushd ~
echo "Backing up server..."
tar -cvzf $backup_dir/$name --exclude-from=$exclusion_list $server_dir
popd

echo "Backed up server in file: $name"
