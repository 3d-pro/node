#!/bin/bash

rm -rf /var/run/rsyslogd.pid
service rsyslog start
service ssh start
cd /opt/app
yarn install
pm2-docker start process.yml
