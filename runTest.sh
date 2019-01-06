#!/bin/bash

returnValue=$(curl -silent  http://192.168.50.6:80 | grep V)
echo "$returnValue"
expectedValue="Hello World VP"

if [ "$returnValue" == "$expectedValue" ];then
  echo “Output is Good“;
else
  echo “Output is NOT  equal“;
fi
