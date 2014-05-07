#!/bin/bash

echo 'Start updating the stats..'

mysql -u now -pplayMeNow -N -e 'SELECT COUNT(*) FROM artists' eva > /home/jetty/stats_backup.txt
mysql -u now -pplayMeNow -N -e 'SELECT COUNT(*) FROM tracks' eva >> /home/jetty/stats_backup.txt
mysql -u now -pplayMeNow -N -e 'SELECT COUNT(*) FROM users' eva >> /home/jetty/stats_backup.txt
mysql -u now -pplayMeNow -N -e 'SELECT COUNT(*) FROM listening_to' eva >> /home/jetty/stats_backup.txt

echo "$(date)" >> /home/jetty/stats_backup.txt 

mv /home/jetty/stats_backup.txt /home/jetty/stats.txt

echo 'Finished updating the stats..'
