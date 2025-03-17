FROM   docker.io/libretime/icecast:2.4.4-alpine
USER   root
COPY   mime.types /etc/mime.types
COPY   icecast.xml /etc/icecast.xml
EXPOSE 8000
USER   icecast

CMD ["/usr/bin/icecast", "-c", "/etc/icecast.xml"]
