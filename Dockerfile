FROM alpine:3.6

MAINTAINER Yan QiDong <yanqd0@outlook.com>

ENV HUGO_VERSION=0.26 \
    HUGO_USER=hugo \
    HUGO_SITE=/srv/hugo

RUN apk update \
    && apk add curl \
    && curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
        | tar -xz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && apk del curl \
    && rm /var/cache/apk/* \
    && rm -rf /tmp/* \
    && adduser ${HUGO_USER} -D

USER ${HUGO_USER}

WORKDIR ${HUGO_SITE}

VOLUME ${HUGO_SITE}

EXPOSE 1313

CMD hugo server --bind 0.0.0.0 \
        --navigateToChanged \
        --buildDrafts
