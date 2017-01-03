#!/bin/bash

service ssh start
cd /opt/app
pm2-docker start --auto-exit process.yml
