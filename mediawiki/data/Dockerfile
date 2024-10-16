FROM docker.io/library/alpine:3.20
ARG MVS
ARG MVF

# install packages
COPY packages/*.apk /tmp/packages/
RUN apk add --repositories-file=/dev/null --no-cache /tmp/packages/*.apk

# install mediawiki
COPY packages/*.zip /tmp/packages/
RUN cd /tmp/packages && unzip "mediawiki-${MVF}.zip" && rsync -a --delete /tmp/packages/mediawiki-${MVF}/ /app/

COPY LocalSettings.php /app/
COPY bermeo.svg /app/resources/assets/logo.svg
