#!/bin/bash

# Exit the script with an error code if one command fails
set -e

echo 'Start updating the stats..'

HOST=""
DATABASE=""
USERNAME=""
PASSWORD=""

mysql -h $HOST -u $USERNAME -p$PASSWORD -N -e 'select replace(format(count(distinct(artistName)), 0), ",", ".") from trackAndArtist;' $DATABASE > /home/jetty/stats_backup.txt
mysql -h $HOST -u $USERNAME -p$PASSWORD -N -e 'select replace(format(count(*), 0), ",", ".") from trackAndArtist;' $DATABASE >> /home/jetty/stats_backup.txt
mysql -h $HOST -u $USERNAME -p$PASSWORD -N -e 'select replace(format(count(*), 0), ",", ".") from listeningEvents;' $DATABASE >> /home/jetty/stats_backup.txt
mysql -h $HOST -u $USERNAME -p$PASSWORD -N -e 'select replace(format(count(distinct(user)), 0), ",", ".") from listeningEvents;' $DATABASE >> /home/jetty/stats_backup.txt

echo "$(date)" >> /home/jetty/stats_backup.txt 

mv /home/jetty/stats_backup.txt /home/jetty/stats.txt

echo 'Finished updating the stats..'
