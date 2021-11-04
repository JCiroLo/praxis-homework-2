#!/usr/bin/env bash

sudo echo "export PORT=4001" >>  /home/vagrant/.bashrc
source  /home/vagrant/.bashrc

cd /shared

nohup ./vuego-demoapp > output.out 2>&1 &
ps -aux

echo "---------------BACKEND: Go server running on port 4001---------------"