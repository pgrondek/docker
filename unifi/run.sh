#!/bin/ash

user='unifi'
group='unifi'

exec 2>&1

base='/srv/unifi'

if [ -d $base ]; then
    cd $base
    version=`head -1 webapps/ROOT/app-unifi/.version`
    echo "Starting UniFi Controller $version"
    java -jar lib/ace.jar start
else
    echo "Missing $base ... aborting"
    touch down
fi
