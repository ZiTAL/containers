FROM alpine:edge

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache amule bash

COPY ./conf/amule.conf /root/.aMule/amule.conf

EXPOSE 4662/tcp 4672/tcp 4712/tcp 4711/tcp
EXPOSE 4662/udp 4672/udp 4712/udp 4711/udp

ENTRYPOINT ["amuled"]
