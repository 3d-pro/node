#!/bin/bash

cd /opt/app

if [ !-d "node_modules" ]; then
  yarn install
fi

pm2-docker start process.yml
