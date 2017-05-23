#!/bin/bash
value="$1"

if [ $value = "1" ]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&f=1"
elif [$value = "2"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&f=2"
elif [$value = "3"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&f=3"
elif [$value = "5"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&f=5"
elif [$value = "6"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&f=6"
elif [$value = "7"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&f=7"
fi
