FROM alpine:3.18

RUN apk --update --no-cache add bind bind-plugins && \
    mkdir -p /var/cache/bind

ADD https://www.internic.net/domain/named.cache /usr/share/dns/root.hints

VOLUME /etc/bind

CMD ["/usr/sbin/named", "-f"]
