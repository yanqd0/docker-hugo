FROM alpine:3.6

MAINTAINER Yan QiDong <yanqd0@outlook.com>

ENV HUGO_VERSION=0.24 \
    HUGO_USER=hugo \
    HUGO_SITE=/srv/hugo

ENV HUGO_URL=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

ADD ${HUGO_URL} /tmp/

RUN tar -xzf /tmp/*.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && rm -rf /tmp/* \
    && adduser ${HUGO_USER} -D

USER ${HUGO_USER}

WORKDIR ${HUGO_SITE}

VOLUME ${HUGO_SITE}

EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0"]
