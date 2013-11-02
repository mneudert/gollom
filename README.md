# Gollom

A key-value store for your precious data.

## Protocol

Gollom understands the [redis protocol](http://redis.io/topics/protocol).

## How To Use

Start using rake:

    # using default ip/port
    rake run

    # or pass ip/port
    rake run["127.0.0.1", 6380]

Connect using redis-cli:

    redis-cli -h [host] -p [port]