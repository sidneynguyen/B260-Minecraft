#!/usr/bin/bash
tmux send-keys -t server-session stop Enter
echo "Shut down server"

cron_regex="^.*backup.sh.*$"
crontab_l=`crontab -l`
if [[ $crontab_l =~ $cron_regex ]]; then
    new_cron=`echo $crontab_l | sed '/backup.sh/d'`
    echo $new_cron | crontab -
    echo "Removed cron job"
else
    echo "Cron job does not exist. Skipping removal"
fi