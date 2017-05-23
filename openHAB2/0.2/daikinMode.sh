#!/bin/bash

# Settings:
# Daikin IP Address and Port
	DIP=192.168.1.39:2000

# Daikin SkyFi Password
  DPass=xxxxx

skyfiset="$DIP/set.cgi?pass=$DPass"

if [ $1 = 1 ]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&m=1"
elif [$1 = 2]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&m=2"
elif [$1 = 3]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&m=3"
elif [$1 = 4]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&m=4"
elif [$1 = 8]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&m=8"
elif [$1 = 9]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&m=9"
elif [$1 = 16]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&m=16"
fi
