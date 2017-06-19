FROM alpine:latest

MAINTAINER Yan QiDong <yanqd0@outlook.com>

ENV VERSION 0.23
ENV HUGO_URL https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz

ADD ${HUGO_URL} /tmp/hugo.tar.gz

RUN cd /tmp \
        && tar -xz hugo.tar.gz \
        && mv hugo /usr/local/bin/hugo \
        && rm -rf /tmp/*

# USER hugo

WORKDIR /srv/hugo

VOLUME /srv/hugo

EXPOSE 1313

CMD hugo server
