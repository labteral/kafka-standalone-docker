#!/bin/bash
source env.sh
docker build \
--build-arg KAFKA_VERSION=$KAFKA_VERSION \
--build-arg KAFKA_SUBVERSION=$KAFKA_SUBVERSION -t labteral/kafka-standalone .
docker tag labteral/kafka-standalone labteral/kafka-standalone:$KAFKA_VERSION