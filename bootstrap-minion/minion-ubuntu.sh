#!/usr/bin/env bash

sudo apt-get update #install updates

sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get install -y nodejs git openjdk-7-jdk ant expect
npm install -g cordova
