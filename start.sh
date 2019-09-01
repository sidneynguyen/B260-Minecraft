#!/usr/bin/bash
tmux new-session -d -s server-session "java -Xmx1024M -Xms1024M -jar server.jar nogui"
echo "Server started"

cron_job="01 * * * * ./backup.sh"
cron_regex="^.*backup.sh.*$"
crontab_l=`crontab -l`
if [[ ! $crontab_l =~ $cron_regex ]]; then
    (echo "$crontab_l" ; echo "$cron_job") | crontab -
    echo "Created cron job"
else
    echo "Cron job already exists. Skipping creation"
fi