# NodeJS 8.x image of Debian Unstable [![Build Status](https://travis-ci.org/3d-pro/node.svg?branch=master)](https://travis-ci.org/3d-pro/node)

## Required Docker Images
- openssh

## Build
```
  docker build -t node:latest .
```
## Run
```
  docker run -d -p 3000:3000 -h node --name node node:latest
```
