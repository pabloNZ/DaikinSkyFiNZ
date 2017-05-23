#!/bin/bash
value="$1"

if [ $value = "1" ]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&m=1"
elif [$value = "2"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&m=2"
elif [$value = "3"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&m=3"
elif [$value = "4"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&m=4"
elif [$value = "8"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&m=8"
elif [$value = "9"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&m=9"
elif [$value = "16"]
then
  curl -X GET "http://192.168.1.39:2000/set.cgi?pass=92136&m=16"
fi
