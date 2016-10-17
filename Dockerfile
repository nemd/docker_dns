FROM alpine:3.4

MAINTAINER michal@reapnet.io

RUN apk --update add unbound wget && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* 

ENV DOCKERIZE_VERSION v0.2.0

RUN wget --no-check-certificate https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

EXPOSE 53/tcp 53/udp

ADD unbound.conf /etc/unbound/
ADD *.zone /etc/unbound/
ADD entry.sh /

RUN chmod +x /entry.sh

CMD ["dockerize", "/entry.sh"]
