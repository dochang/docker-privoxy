FROM alpine:latest
MAINTAINER dochang@gmail.com

RUN apk add --update-cache privoxy && \
    chown -R root:root /var/log/privoxy /etc/privoxy && \
    chmod 0700 /var/log/privoxy && \
    mkdir -p /usr/local/share && \
    chown root:root /usr/local/share && \
    tar --create --file - --directory /etc privoxy | tar --extract --file - --directory /usr/local/share && \
    rm -rf /var/cache/apk/*

VOLUME ["/etc/privoxy", "/var/log/privoxy"]
EXPOSE 8118
CMD ["/usr/sbin/privoxy", "--no-daemon", "/etc/privoxy/config"]
