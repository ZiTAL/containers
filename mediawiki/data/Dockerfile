FROM cgr.dev/chainguard/wolfi-base

ARG MVS
ARG MVF
ARG MEXT

# install packages
COPY packages/*.apk /tmp/packages/
RUN apk add --repositories-file=/dev/null --no-cache --allow-untrusted /tmp/packages/*.apk && rm -rf /tmp/packages/*.apk

# install packages remote
#RUN apk add git rsync unzip wget zip 

# install mediawiki remote
#RUN cd /tmp && wget "https://releases.wikimedia.org/mediawiki/${MVS}/mediawiki-${MVF}.zip" && unzip "mediawiki-${MVF}.zip" && rsync -a --delete /tmp/mediawiki-${MVF}/ /app/ && rm -rf /tmp/mediawiki*
#RUN cd /app/extensions && git clone https://gerrit.wikimedia.org/r/mediawiki/extensions/MobileFrontend && cd /app/extensions/MobileFrontend && git checkout ${MEXT}

# install mediawiki local
COPY packages/*.zip /tmp/packages/
RUN cd /tmp/packages && unzip "mediawiki-${MVF}.zip" && rsync -a --delete /tmp/packages/mediawiki-${MVF}/ /app/
RUN cd /app/extensions && git config --global http.postBuffer 524288000 && git config --global http.maxRequestBuffer 524288000 && git config --global core.compression 0 && git clone https://gerrit.wikimedia.org/r/mediawiki/extensions/MobileFrontend && cd /app/extensions/MobileFrontend && git checkout ${MEXT}
RUN rm -rf /tmp/packages

COPY LocalSettings.php /app/
COPY logo.svg /app/resources/assets/logo.svg

CMD ["tail", "-f", "/dev/null"]
