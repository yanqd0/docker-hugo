FROM alpine:latest

MAINTAINER Yan QiDong <yanqd0@outlook.com>

ENV HUGO_VERSION=0.23 \
    HUGO_USER=hugo \
    HUGO_SITE=/srv/hugo \
    HUGO_HOME=/usr/local/share/hugo

ENV PATH=${HUGO_HOME}:$PATH \
    HUGO_URL=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

ADD ${HUGO_URL} ${HUGO_HOME}

RUN adduser ${HUGO_USER} -D

USER ${HUGO_USER}

WORKDIR ${HUGO_SITE}

VOLUME ${HUGO_SITE}

EXPOSE 1313

CMD hugo server
