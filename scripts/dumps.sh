#!/bin/bash

# Exit the script with an error code if one command fails
set -e

echo 'Start updating the dumps..'

/home/user/DBIS/dump-rdf -f N-TRIPLE /home/user/DBIS/scripts/mapping.ttl > /mnt/eva_nas/dump_90/nowplaying-dump.nt
gzip -f -5 /mnt/eva_nas/dump_90/nowplaying-dump.nt

mv /mnt/eva_nas/dump_90/nowplaying-dump.nt.gz /mnt/eva_nas/dump_90/public/nowplaying-dump.nt.gz

echo "$(date)" >> /home/jetty/dumps_backup.txt
mv /home/jetty/dumps_backup.txt /home/jetty/dumps.txt

echo 'Finished updating the dumps..'
