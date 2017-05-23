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
#stempStr=${daikinArray[2]}

# Variables from returned string
#stemp=${stempStr:(-4)}	#Temperature set point

# If the OH fan state is changed then this script is called.
# It checks the state of the OH item by comparing a value returned from a curl script ($pow) and then sets the mode option chosen.
# If $pow is 1 then it sends a curl to the AC to turn it off. Else do nothing.

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
