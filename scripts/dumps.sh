#!/bin/bash

echo 'Start updating the dumps..'

./dump-rdf -f N-TRIPLE /home/user/DBIS/webapp/WEB-INF/mapping.ttl > /home/jetty/nowplaying-dump.nt
./dump-rdf -f RDF/XML /home/user/DBIS/webapp/WEB-INF/mapping.ttl > /home/jetty/nowplaying-dump.rdf

echo 'Finished updating the dumps..'