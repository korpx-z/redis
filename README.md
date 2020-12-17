### version 5.0 is built via master branch, 6.0 via 6.0 branch

### This image is built to run on s390x architecture
-    [build source](https://github.com/korpx-z/redis/tree/master)
-    [original source code](https://github.com/docker-library/redis)

### Versions
5.0, 6.0

# Redis

Redis is an open-source, networked, in-memory, key-value data store with optional durability. It is written in ANSI C. The development of Redis is sponsored by Redis Labs today; before that, it was sponsored by Pivotal and VMware. According to the monthly ranking by DB-Engines.com, Redis is the most popular key-value store. The name Redis means REmote DIctionary Server.

> [wikipedia.org/wiki/Redis](https://en.wikipedia.org/wiki/Redis)

# Security

For the ease of accessing Redis from other containers via Docker networking, the "Protected mode" is turned off by default. This means that if you expose the port outside of your host (e.g., via `-p` on `docker run`), it will be open without a password to anyone. It is **highly** recommended to set a password (by supplying a config file) if you plan on exposing your Redis instance to the internet. For further information, see the following links about Redis security:

-	[Redis documentation on security](https://redis.io/topics/security)
-	[Protected mode](https://redis.io/topics/security#protected-mode)
-	[A few things about Redis security by antirez](http://antirez.com/news/96)

# How to use this image

## start a redis instance

```console
$ docker run --name some-redis -d quay.io/ibm/redis:6.0
```

## start with persistent storage

```console
$ docker run --name some-redis -d quay.io/ibm/redis:6.0 redis-server --appendonly yes
```

If persistence is enabled, data is stored in the `VOLUME /data`, which can be used with docker volumes (see [docs.docker volumes](https://docs.docker.com/engine/tutorials/dockervolumes/)).

For more about Redis Persistence, see [http://redis.io/topics/persistence](http://redis.io/topics/persistence).

## connecting via `redis-cli`

```console
$ docker run -it --network some-network --rm quay.io/ibm/redis:6.0 redis-cli -h some-redis
```

## Additionally, If you want to use your own redis.conf ...

You can create your own Dockerfile that adds a redis.conf from the context into /data/, like so.

```dockerfile
FROM quay.io/ibm/redis:6.0
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
```

Alternatively, you can mount a docker volume that contains the custom config file:

```console
$ docker run -v <MY_VOLUME>/redis.conf:/usr/local/etc/redis/redis.conf --name myredis quay.io/ibm/redis:6.0 redis-server /usr/local/etc/redis/redis.conf
```

Where `<MY_VOLUME>` is the docker volume containing your `redis.conf` file. Using this method means that there is no need for you to have a Dockerfile for your redis container.


# License

View [license information](http://redis.io/topics/license) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in [the `repo-info` repository's `redis/` directory](https://github.com/docker-library/repo-info/tree/master/repos/redis).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
