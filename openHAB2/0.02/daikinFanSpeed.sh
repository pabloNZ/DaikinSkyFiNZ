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
#f_rateStr=${daikinArray[3]}

# Variables from returned string
#f_rate=${f_rateStr//[^0-9]/}	#Fan speed (1=low,2=med,3=high,5=low/auto,6=med/auto,7=high/auto)

# If the OH fan state is changed then this script is called.
# It checks the state of the OH item by comparing a value returned from a curl script ($pow) and then sets the mode option chosen.
# If $pow is 1 then it sends a curl to the AC to turn it off. Else do nothing.

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
