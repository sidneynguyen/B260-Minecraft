#!/usr/bin/bash

current_date=`date +"%Y-%m-%d-%H"`

world_archive="$current_date.tar.gz"

if [ ! -f $world_archive ]; then
    tar -czvf $world_archive world
    echo "Archived world to $world_archive"
else
    echo "Archive $world_archive already exists"
fi