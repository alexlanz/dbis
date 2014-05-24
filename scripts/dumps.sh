#!/bin/bash

echo 'Start updating the dumps..'

/home/user/DBIS/dump-rdf -f N-TRIPLE /home/user/DBIS/scripts/mapping.ttl > /mnt/eva_nas/dump_90/nowplaying-dump.nt
gzip -f -5 /mnt/eva_nas/dump_90/nowplaying-dump.nt

mv /mnt/eva_nas/dump_90/nowplaying-dump.nt.gz /mnt/eva_nas/dump_90/public/nowplaying-dump.nt.gz

echo 'Finished updating the dumps..'
