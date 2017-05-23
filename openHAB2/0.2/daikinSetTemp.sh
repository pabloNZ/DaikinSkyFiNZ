#!/bin/sh
value="$1"

if [ $value = "18" ]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&t=18"
elif [$value = "19"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&t=19"
elif [$value = "20"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&t=20"
elif [$value = "21"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&t=21"
elif [$value = "22"]
then
	curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&t=22"
elif [$value = "23"]
then
	curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&t=23"
elif [$value = "24"]
then
	curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&t=24"
fi
