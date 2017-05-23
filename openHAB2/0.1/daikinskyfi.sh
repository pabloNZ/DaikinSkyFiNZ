#!/bin/bash
argument="$1"
#
# This script needs to be called after any change to the items
# related to the daikinArray.
# You should also call the script every minute via a cron job rule
# to determine if changes have been made on the controller
#
# OH control for Daikin airconditioner systems with
# SkyFi controller.
# For this script to work you need to have installed curl
# Read the post or wiki for installation instructions
#
# This script comes with no warranty ...use at own risk
#
# I use it in openHAB2

# Settings:
# Daikin IP Address and Port
	DIP=192.168.1.xx:2000

# Daikin SkyFi Password
  DPass=xxxxx

# OH IP Address and Port
	OIP=192.168.1.xx:8080

# On/Off button item name
	OoId=heatingDaikinPower

# Temp item name - Spinner item?
	TempId=heatingDaikinTemp

# Temp sensor data
	TempIn=heatingDaikinTempIn
	TempOut=heatingDaikinTempOut

# Mode item name
	ModeId=heatingDaikinMode

# Fan speed item name
	FanSpId=heatingDaikinFanSp

############################################################
# NO CHANGES AFTER THIS LINE ## NO CHANGES AFTER THIS LINE #
############################################################

# SkyFi info url path
skyfi="$DIP/ac.cgi?pass=$DPass"
skyfiset="$DIP/set.cgi?pass=$DPass"

# Set complete path for Daikin SkyFi Contol
SkyFiInfoPath=http://$skyfi
SkyFiInfo=$(curl -s $SkyFiInfoPath)

sleep 5s

# SkyFiInfo Will retun something like: opmode=0&units=.&settemp=24.0&fanspeed=3&fanflags=1&acmode=4&tonact=0&toffact=0&prog=0&time=21:27&day=4&roomtemp=14&outsidetemp=14&louvre=1&zone=0&flt=0&test0&errcode=&sensors=

# Get relevant information from Daikin SkyFi unit
daikinArray=($SkyFiInfo)

IFS='&' read -r -a daikinArray <<<"$SkyFiInfo"
powStr=${daikinArray[0]}
stempStr=${daikinArray[2]}
f_rateStr=${daikinArray[3]}
f_modeStr=${daikinArray[4]}
modeStr=${daikinArray[5]}
htempStr=${daikinArray[11]}
otempStr=${daikinArray[12]}
dzoneStr=${daikinArray[14]}
filterStr=${daikinArray[15]}

# Variables from returned string
pow=${powStr//[^0-9]/} #Power on(1)/off(0)
mode=${modeStr//[^0-9]/}	#Mode (1=auto,2=heat,4=dry,8=cool,16=fan,9=cool/auto,3=heat/auto)
stemp=${stempStr:(-4)}	#Temperature set point
f_rate=${f_rateStr//[^0-9]/}	#Fan speed (1=low,2=med,3=high,5=low/auto,6=med/auto,7=high/auto)
f_mode=${f_modeStr//[^0-9]/}		#Fan (1 = Manual, 3= Auto)
htemp=${htempStr//[^0-9]/}	 	#Current Room Temp
otemp=${otempStr//[^0-9]/}	 	#Current Outside Temp
dzone=${dzoneStr//[^0-9]/}  	#Zones Enabled (Zone 1 = 128 Zone 2 = 64 Zone 3 = 32 Zone 4 = 16 Zone 5 = 8 Zone 6 = 4 Zone 7 = 2 Zone 8 = 1)
filter=${filterStr//[^0-9]/}	#Filter clean 1=yes

###################################################
# POST temperature values to the openHAB REST API #
###################################################
curl --silent --header 'Content-Type: text/plain' --request POST "http://$OIP/rest/items/$TempIn" --data $htemp
curl --silent --header 'Content-Type: text/plain' --request POST "http://$OIP/rest/items/$TempOut" --data $otemp
curl --silent --header 'Content-Type: text/plain' --request POST "http://$OIP/rest/items/$OoId" --data $pow
curl --silent --header 'Content-Type: text/plain' --request POST "http://$OIP/rest/items/$TempId" --data $stemp
curl --silent --header 'Content-Type: text/plain' --request POST "http://$OIP/rest/items/$ModeId" --data $mode
curl --silent --header 'Content-Type: text/plain' --request POST "http://$OIP/rest/items/$FanSpId" --data $f_rate
