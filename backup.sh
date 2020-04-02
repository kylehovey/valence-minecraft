#!/bin/bash

backup_count=5
backup_dir=backups
server_dir=server
ignore_files=(
	server/plugins/*
)
ignore_directives=()

for path in ${ignore_files[@]}; do
	ignore_directives+=(--exclude="$path");
done

name="$(date +"%Y-%m-%d--%H--%M--%S").backup.tar.gz"
echo "Removing old backups"
ls -t | tail -n +$backup_count | xargs rm --
echo "Backing up server..."
pushd
tar -cvzf $backup_dir/$name "${exclude[@]}" $server_dir
popd
echo "Backed up server in file: $name"
