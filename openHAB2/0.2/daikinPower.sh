#!/bin/bash

# Settings:
# Daikin IP Address and Port
	DIP=192.168.1.39:2000

# Daikin SkyFi Password
  DPass=xxxxx

# OH IP Address and Port
#	OIP=192.168.1.20:8080

# SkyFi info url path
#skyfi="$DIP/ac.cgi?pass=$DPass"
skyfiset="$DIP/set.cgi?pass=$DPass"

# Set complete path for Daikin SkyFi Contol
#SkyFiInfoPath=http://$skyfi
#SkyFiInfo=$(curl -s $SkyFiInfoPath)

#sleep 5s

# SkyFiInfo Will retun something like: opmode=0&units=.&settemp=24.0&fanspeed=3&fanflags=1&acmode=4&tonact=0&toffact=0&prog=0&time=21:27&day=4&roomtemp=14&outsidetemp=14&louvre=1&zone=0&flt=0&test0&errcode=&sensors=

# Get relevant information from Daikin SkyFi unit
#daikinArray=($SkyFiInfo)

#IFS='&' read -r -a daikinArray <<<"$SkyFiInfo"
#powStr=${daikinArray[0]}

# Variables from returned string
#pow=${powStr//[^0-9]/} #Power on(1)/off(0)

# If the OH switch is set to ON then this script is called.
# It checks the state of the AC by comparing a value returned from a curl script ($pow) with the OH switch state (1).
# If $pow is 0 then it sends a curl to the AC to turn it on. Else do nothing.

if [ $1 = "0" ] || [ $1 = "Off" ]
then
  curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&p=1"
else
	curl -S -H 'Content-Type: text/plain' -X POST "http://$skyfiset" -d "&p=0"
fi
