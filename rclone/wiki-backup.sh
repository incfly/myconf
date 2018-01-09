#!/bin/bash

# The script to backup wikidata from /var/www/dokuwiki to Google Drive.
# - It's intended to run as a crontab job. 
# - It uses the exclu 
# Troubleshooting:
# rclone config setup: https://rclone.org/drive/

LOG_FILE="/home/jianfeih/log/wiki_$(date +%Y_%m_%d).log"

echo "===============================================
Running backup script for dokuwiki on $(date)
================================================
" >> ${LOG_FILE}

# backup command 
rclone sync /var/www/dokuwiki drive:/Sync/dokuwiki --verbose --exclude-from=/home/jianfeih/workspace/myconf/rclone/exclude.txt >> $LOG_FILE 2>&1

echo "===============================================
rclone backup completed $(date) 
================================================
" >> ${LOG_FILE}

