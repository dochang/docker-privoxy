FROM debian:sid
MAINTAINER dochang@gmail.com

RUN apt-get update && \
    apt-get --yes install --no-install-recommends privoxy && \
    chown root:root /var/log/privoxy /etc/privoxy && \
    chmod 0700 /var/log/privoxy && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/privoxy", "/var/log/privoxy"]
EXPOSE 8118
CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]
