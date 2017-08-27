#!/bin/bash

cd /opt/app
if [ ! -f "/opt/app/node_modules" ];
then
	yarn install
fi

service ssh start
pm2-docker start --auto-exit process.yml
