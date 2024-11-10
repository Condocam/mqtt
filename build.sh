#!/bin/sh

export $(grep -v '^#' .env | xargs)

docker build --build-arg MOSQUITTO_USER=$MOSQUITTO_USER --build-arg MOSQUITTO_PASSWORD=$MOSQUITTO_PASSWORD -f mqtt.Dockerfile -t mqtt .