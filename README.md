# docker-hugo

The smallest [hugo] image built from Alpine.

[hugo]:https://github.com/gohugoio/hugo/

## Install

[![Docker Build Status](https://img.shields.io/docker/build/yanqd0/hugo.svg)](https://hub.docker.com/r/yanqd0/hugo/builds/)
[![Docker Automated build](https://img.shields.io/docker/automated/yanqd0/hugo.svg)](https://hub.docker.com/r/yanqd0/hugo/builds/)
[![Docker Stars](https://img.shields.io/docker/stars/yanqd0/hugo.svg)](https://hub.docker.com/r/yanqd0/hugo/)
[![Docker Pulls](https://img.shields.io/docker/pulls/yanqd0/hugo.svg)](https://hub.docker.com/r/yanqd0/hugo/)

```sh
docker pull yanqd0/hugo
```

## Usage

There are two simple ways to use the image when developing,
`docker run` or `docker-compose up`.

(If you want to know the usage of [hugo], please visit [gohugo.io].)

[gohugo.io]:http://gohugo.io/

### docker run

As the help of `hugo server` says:

> Hugo provides its own webserver which builds and serves the site.
> While hugo server is high performance, it is a webserver with limited options.
> Many run it in production, but the standard behavior is for people to use it
> in development and use a more full featured server such as Nginx or Caddy.
>
> `hugo server` will avoid writing the rendered and served content to disk,
> preferring to store it in memory.

The default command of this docker image is `hugo server`.

When generating the `public` directory in the **production environment**,
please specify the command to `hugo`.

```sh
docker run --rm -v $PWD:/srv/hugo yanqd0/hugo hugo
```

If the current directory is not the hugo project, you can replace `$PWD` with the path.

### docker-compose up

It may not be a convenient way to use `docker run` in the **development environment**.

I prefer to use a [docker-compose.yml file].

You can write a `docker-compose.yml` in your hugo project like this:

```yaml
version: '3'

services:
  hugo:
    image: yanqd0/hugo
    volumes:
      - .:/srv/hugo
    ports:
      - 1313:1313
```

And then, run `docker-compose up -d`.

There is a verified [docker-compose.yml] for example.

[![Build Status](https://travis-ci.org/yanqd0/docker-hugo.svg?branch=master)](https://travis-ci.org/yanqd0/docker-hugo)

[docker-compose.yml file]:https://docs.docker.com/compose/compose-file/
[docker-compose.yml]:https://github.com/yanqd0/docker-hugo/blob/master/docker-compose.yml

## Version

| Name   | Version |
| ----   | ------: |
| Alpine | 3.7     |
| Hugo   | 0.40.1  |
| Git    | 2.15.0  |

It is welcome to remind me about updates by [issues].

[issues]:https://github.com/yanqd0/docker-hugo/issues/new

## Size

| Status     | Size                                |
| ------     | ---:                                |
| Compressed | [![][microbadger.svg]][microbadger] |
| Extracted  | 36.7 MB                             |

I use the official [releases] instead of compiling from source, so the image is very small.

[releases]:https://github.com/gohugoio/hugo/releases
[microbadger.svg]:https://images.microbadger.com/badges/image/yanqd0/hugo.svg
[microbadger]:https://microbadger.com/images/yanqd0/hugo

## License

[![License](https://img.shields.io/github/license/yanqd0/docker-hugo.svg)](https://github.com/yanqd0/docker-hugo/blob/master/LICENSE)

> MIT License
>
> Copyright (c) 2017 Yan QiDong <yanqd0@outlook.com>
