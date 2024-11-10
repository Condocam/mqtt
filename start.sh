#!/bin/sh

docker run -d -p 1883:1883 -p 8883:8883 -p 9001:9001 -v ./data:/mosquitto/data -v ./log:/mosquitto/log --name mqtt mqtt