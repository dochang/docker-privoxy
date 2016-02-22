FROM dochang/confd:latest
MAINTAINER dochang@gmail.com

COPY scripts /scripts

RUN set -ex && \
    /scripts/privoxy/install.sh && \
    /scripts/apk/clean.sh

VOLUME ["/etc/privoxy", "/var/log/privoxy"]
EXPOSE 8118
CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]
