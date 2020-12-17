FROM ibmjava:8-jre

ARG KAFKA_VERSION
ARG KAFKA_SUBVERSION
ENV KAFKA_INSTALL_DIR=/opt/kafka

RUN \
    ARCHIVE=kafka_$KAFKA_SUBVERSION-$KAFKA_VERSION.tgz && \
    ARCHIVE_URL=https://archive.apache.org/dist/kafka/$KAFKA_VERSION/$ARCHIVE && \
    CHECKSUM_URL=$ARCHIVE_URL.sha1 && \
    wget $ARCHIVE_URL && \
    wget $CHECKSUM_URL && \
    mkdir $KAFKA_INSTALL_DIR && \
    sha1sum $ARCHIVE.sha1 && \
    tar xvf $ARCHIVE -C $KAFKA_INSTALL_DIR && \
    rm -f $ARCHIVE && \
    rm -f $ARCHIVE.sha1 && \
    ln -s $KAFKA_INSTALL_DIR/*kafka* $KAFKA_INSTALL_DIR/default

ENV PATH=$KAFKA_INSTALL_DIR/default/bin:$PATH

COPY config $KAFKA_INSTALL_DIR/default/config
COPY bin $KAFKA_INSTALL_DIR/default/bin
COPY entrypoint.sh /
ENTRYPOINT bash entrypoint.sh