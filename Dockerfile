FROM debian:sid
MAINTAINER dochang@gmail.com

RUN apt-get update && \
    apt-get --yes install --no-install-recommends privoxy && \
    mkdir -p /usr/local/share && \
    chown root:staff /usr/local/share && \
    tar c -f - -C /etc privoxy | tar x -f - -C /usr/local/share && \
    chown -R root:staff /usr/local/share/privoxy && \
    chown root:root /var/log/privoxy /etc/privoxy && \
    chmod 0700 /var/log/privoxy && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/privoxy", "/var/log/privoxy"]
EXPOSE 8118
CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]
