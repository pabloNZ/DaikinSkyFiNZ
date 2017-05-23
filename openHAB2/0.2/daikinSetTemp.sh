#!/bin/bash

# Settings:
# Daikin IP Address and Port
	DIP=192.168.1.39:2000

# Daikin SkyFi Password
  DPass=xxxxx

skyfiset="$DIP/set.cgi?pass=$DPass"

if [ $1 = 18 ]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&t=18"
elif [$1 = 19]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&t=19"
elif [$1 = 20]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&t=20"
elif [$1 = 21]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&t=21"
elif [$1 = 22]
then
	curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&t=22"
elif [$1 = 23]
then
	curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&t=23"
elif [$1 = 24]
then
	curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&t=24"
fi
