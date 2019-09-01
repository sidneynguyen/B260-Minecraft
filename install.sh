#!/usr/bin/bash
if [ "$#" -ne 1 ]; then
    echo "server_dir required"
    exit 1
fi

server_dir=$1

server_files=(
    start.sh
    shutdown.sh
    backup.sh
)

for server_file in "${server_files[@]}"; do
    cp $server_file $server_dir
    echo "Installed $server_file to $server_dir"
done
