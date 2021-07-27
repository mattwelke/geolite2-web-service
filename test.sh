#!/bin/bash

MY_IP=$(curl -s https://api.ipify.org/)

echo "IP = ${MY_IP}"

curl -XPOST -H 'Content-Type: text/plain' -d $MY_IP http://localhost:8080/geo
