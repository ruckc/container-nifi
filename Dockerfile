FROM docker.io/eclipse-temurin:17.0.5_8-jre

ARG VERSION=1.19.0

RUN apt update && \
    apt install unzip && \
    apt clean all && \
    mkdir -p /opt && \
    curl -s -L https://www.apache.org/dyn/closer.lua/nifi/${VERSION}/nifi-${VERSION}-bin.zip?action=download -o /tmp/nifi.zip && \
    unzip /tmp/nifi.zip -d /opt && \
    mv /opt/nifi-${VERSION} /opt/nifi && \
    rm -rf /tmp/nifi.zip

COPY run.sh /opt/nifi/run.sh

ENTRYPOINT ["/bin/sh", "/opt/nifi/run.sh"]
