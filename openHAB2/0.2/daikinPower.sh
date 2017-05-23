#!/bin/bash

# Settings:
# Daikin IP Address and Port
	DIP=192.168.1.39:2000

# Daikin SkyFi Password
  DPass=xxxxx

skyfiset="$DIP/set.cgi?pass=$DPass"

if [ $1 = "0" ] || [ $1 = "Off" ]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&p=1"
else
	curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&p=0"
fi
