#!/bin/bash

echo 'Start updating the stats..'

HOST=""
DATABASE=""
USERNAME=""
PASSWORD=""

mysql -h $HOST -u $USERNAME -p$PASSWORD -N -e 'select count(distinct(artistName)) from trackAndArtist;' $DATABASE > /home/jetty/stats_backup.txt
mysql -h $HOST -u $USERNAME -p$PASSWORD -N -e 'select count(distinct(trackTitle)) from trackAndArtist;' $DATABASE >> /home/jetty/stats_backup.txt
mysql -h $HOST -u $USERNAME -p$PASSWORD -N -e 'select count(*) from listeningEvents;' $DATABASE >> /home/jetty/stats_backup.txt

echo "$(date)" >> /home/jetty/stats_backup.txt 

mv /home/jetty/stats_backup.txt /home/jetty/stats.txt

echo 'Finished updating the stats..'
