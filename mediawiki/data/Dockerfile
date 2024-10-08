FROM docker.io/library/alpine:3.20
ARG MVS
ARG MVF

COPY packages/*.apk /tmp/packages/
RUN apk add --repositories-file=/dev/null --no-cache /tmp/packages/*.apk
#RUN cd /tmp && wget "https://releases.wikimedia.org/mediawiki/${MVS}/mediawiki-${MVF}.zip" && unzip "mediawiki-${MVF}.zip" && rsync -a --delete /tmp/mediawiki-${MVF}/ /app/
