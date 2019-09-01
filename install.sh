#!/usr/bin/bash
server_dir=$1

server_files=(
    start.sh
    shutdown.sh
    backup.sh
)

for server_file in "${server_files[@]}"; do
    mv $server_file $server_dir
    chmod u+x "$server_dir/$server_file"
    echo "Installed $server_file to $server_dir"
done