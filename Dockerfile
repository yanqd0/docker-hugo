FROM alpine:3.6

MAINTAINER Yan QiDong <yanqd0@outlook.com>

ENV HUGO_VERSION=0.25.1 \
    HUGO_USER=hugo \
    HUGO_SITE=/srv/hugo

ENV HUGO_URL=https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN apk update \
    && apk add curl \
    && curl -L ${HUGO_URL} -o /tmp/hugo.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && apk del curl \
    && rm -rf /tmp/* \
    && rm /var/cache/apk/* \
    && adduser ${HUGO_USER} -D

USER ${HUGO_USER}

WORKDIR ${HUGO_SITE}

VOLUME ${HUGO_SITE}

EXPOSE 1313

CMD ["hugo", "server", "--bind", "0.0.0.0", "--navigateToChanged"]
