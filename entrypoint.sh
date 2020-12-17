#!/bin/bash
while true; do
    zookeeper-server-start.sh $KAFKA_INSTALL_DIR/default/config/zookeeper.properties &
    for i in {1..5}; do
        kafka-server-start.sh $KAFKA_INSTALL_DIR/default/config/server.properties
    done
done