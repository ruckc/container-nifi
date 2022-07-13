FROM docker.io/eclipse-temurin:17-jre

ARG VERSION=1.16.3

RUN mkdir -p /opt && \
    curl -L https://www.apache.org/dyn/closer.lua/nifi/${VERSION}/nifi-${VERSION}-bin.tar.gz?action=download -o /tmp/nifi.tar.gz && \
    tar -zxvf /tmp/nifi.tar.gz -C /opt && \
    mv /opt/nifi-${VERSION} /opt/nifi && \
    rm -rf /tmp/nifi.tar.gz

COPY run.sh /opt/nifi/run.sh

ENTRYPOINT ["/bin/sh", "/opt/nifi/run.sh"]
