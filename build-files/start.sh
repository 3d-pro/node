#!/bin/bash

cd /opt/app

if [ !-d "$DIRECTORY" ]; then
  yarn install
fi

pm2-docker start process.yml
