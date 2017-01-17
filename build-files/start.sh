#!/bin/bash

if [ -f "/firstrun.sh" ];
then
        /firstrun.sh
fi

service ssh start
cd /opt/app
pm2-docker start --auto-exit process.yml
