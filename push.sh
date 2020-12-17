#!/bin/bash
source env.sh
docker push labteral/kafka-standalone:latest
docker push labteral/kafka-standalone:$KAFKA_VERSION