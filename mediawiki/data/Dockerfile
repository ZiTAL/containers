FROM docker.io/library/alpine:3.14
ARG MVS
ARG MVF

RUN apk update && apk add unzip wget rsync
RUN cd /tmp && wget "https://releases.wikimedia.org/mediawiki/${MVS}/mediawiki-${MVF}.zip" && unzip "mediawiki-${MVF}.zip" && rsync -a --delete /tmp/mediawiki-${MVF}/ /app/
