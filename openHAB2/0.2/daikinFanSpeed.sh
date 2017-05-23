#!/bin/bash

# Settings:
# Daikin IP Address and Port
	DIP=192.168.1.39:2000

# Daikin SkyFi Password
  DPass=xxxxx

skyfiset="$DIP/set.cgi?pass=$DPass"

if [ $1 = 1 ]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&f=1"
elif [$1 = 2]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&f=2"
elif [$1 = 3]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&f=3"
elif [$1 = 5]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&f=5"
elif [$1 = 6]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&f=6"
elif [$1 = 7]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&f=7"
fi
