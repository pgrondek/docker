FROM alpine:3.9

ARG VERSION
ADD http://www.ubnt.com/downloads/unifi/$VERSION/UniFi.unix.zip /srv/unifi.zip
COPY run.sh /srv/unifi/run.sh

RUN cd /srv && \
    unzip -q unifi.zip && \
    mv /srv/UniFi/* /srv/unifi && \
    rmdir /srv/UniFi && \
    rm /srv/unifi/bin/mongod && \
    chmod +x /srv/unifi/run.sh && \
    apk add --no-cache openjdk8-jre mongodb && \
    adduser -D -H -h /srv/unifi unifi && \
    mkdir -p /srv/unifi/logs \
             /srv/unifi/data && \
    chown -R unifi:unifi /srv/unifi && \
    ln -s /dev/stdout /srv/unifi/logs/server.log && \
    ln -s /dev/stdout /srv/unifi/logs/mongod.log && \
    ln -s /usr/bin/mongod /srv/unifi/bin/mongod

USER unifi
# Unifi STUN port
EXPOSE 3478/udp
# Required for AP discovery
EXPOSE 10001/udp
## Required for device communication
EXPOSE 8080
## Unifi web admin port
EXPOSE 8443
# Required for Make controller discoverable on L2 network option
EXPOSE 1900/udp

VOLUME "/srv/unifi/dl"
VOLUME "/srv/unifi/data"

WORKDIR "/srv/unifi"
CMD ["/srv/unifi/run.sh"]
