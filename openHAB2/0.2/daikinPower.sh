#!/bin/bash
value="$1"

if [ $value = "0" ]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&p=0"
else
	curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&p=1"
fi
