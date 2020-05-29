# docker-hugo

The smallest [hugo] image built from Alpine.

[hugo]:https://github.com/gohugoio/hugo/

## Install

[![Docker Build Status](https://img.shields.io/docker/build/yanqd0/hugo.svg)](https://hub.docker.com/r/yanqd0/hugo/builds/)
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

Run `docker-compose up -d`, then a hugo server with many arguments in the port 1313 is serving.

There is a verified [docker-compose.yml] for example.

[![Build Status](https://travis-ci.org/yanqd0/docker-hugo.svg?branch=master)](https://travis-ci.org/yanqd0/docker-hugo)

[docker-compose.yml file]:https://docs.docker.com/compose/compose-file/
[docker-compose.yml]:https://github.com/yanqd0/docker-hugo/blob/master/docker-compose.yml

## Version

| Name   | Version |
| ----   | ------: |
| Alpine | 3.9     |
| Hugo   | 0.62.0  |
| Git    | 2.20.1  |

It is welcome to remind me about updates by [issues].

[issues]:https://github.com/yanqd0/docker-hugo/issues/new

## Size

| Status     | Size                                |
| ------     | ---:                                |
| Compressed | [![][microbadger.svg]][microbadger] |
| Extracted  | 61.1MB                              |

I use the official [releases] instead of compiling from source, so the image is very small.

[releases]:https://github.com/gohugoio/hugo/releases
[microbadger.svg]:https://images.microbadger.com/badges/image/yanqd0/hugo.svg
[microbadger]:https://microbadger.com/images/yanqd0/hugo

## Change Log

The image will update with hugo [releases].
I will try to change less.

Since the tag `0.50`, the `root` user is used to generate sites.
Before that, a `hugo` user with the pid `1000` is used,
which will cause a permission problem when generating a `public` directory.
In fact, a user in the group `docker` can also have the `root` permission inside the container.
The `hugo server` should not be used in a production environment,
so it is unnecessary to use a non-root user to ensure safety.

Since the tag '0.30', a executable `git` is added to this image.
Some functions needs `git`.

## License

[![License](https://img.shields.io/github/license/yanqd0/docker-hugo.svg)](https://github.com/yanqd0/docker-hugo/blob/master/LICENSE)

> MIT License
>
> Copyright (c) 2017~2020 Yan QiDong <yanqd0@outlook.com>
