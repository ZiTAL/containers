FROM docker.io/library/alpine:3.20
ARG MVS
ARG MVF

# install packages
COPY packages/*.apk /tmp/packages/
RUN apk add --repositories-file=/dev/null --no-cache /tmp/packages/*.apk

# install mediawiki remote
RUN cd /tmp && wget "https://releases.wikimedia.org/mediawiki/${MVS}/mediawiki-${MVF}.zip" && unzip "mediawiki-${MVF}.zip" && rsync -a --delete /tmp/mediawiki-${MVF}/ /app/

# install mediawiki local
# COPY packages/*.zip /tmp/packages/
# RUN cd /tmp/packages && unzip "mediawiki-${MVF}.zip" && rsync -a --delete /tmp/packages/mediawiki-${MVF}/ /app/

COPY LocalSettings.php /app/
COPY logo.svg /app/resources/assets/logo.svg
