FROM alpine:3.11

LABEL maintainer='Yan QiDong <yanqd0@outlook.com>'

ENV HUGO_VERSION=0.74.2 \
    HUGO_SITE=/srv/hugo

RUN apk --no-cache add \
        curl \
        git \
    && curl -SL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
        -o /tmp/hugo.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/local/bin/ \
    && apk del curl \
    && mkdir -p ${HUGO_SITE} \
    && rm -rf /tmp/*

WORKDIR ${HUGO_SITE}

VOLUME ${HUGO_SITE}

EXPOSE 1313

CMD hugo server \
    --bind 0.0.0.0 \
    --navigateToChanged \
    --templateMetrics \
    --buildDrafts
