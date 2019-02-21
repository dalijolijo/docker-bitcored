
# docker-bitcored

[![Build Status](https://travis-ci.org/dalijolijo/docker-bitcored.svg?branch=master)](https://travis-ci.org/dalijolijo/docker-bitcored)
[![Docker Pulls](https://img.shields.io/docker/pulls/dalijolijo/bitcored.svg)](https://hub.docker.com/r/dalijolijo/bitcored)

> Run a full Bitcore node with one command

A Docker configuration with sane defaults for running a full
Bitcore node.

## Usage

```
docker run -v /home/username/.bitcore:/data -p 5889:5889 dalijolijo/bitcored
```

If there's a `bitcore.conf` in the `/data` volume it'll be used. If not, one will be created for you with a randomly generated JSON-RPC password.

### JSON-RPC

To access JSON-RPC you'll also need to expose port 5888. You probably only want this available to localhost:

```
docker run -v /home/username/.bitcore:/data -p 5889:5889 -p 127.0.0.1:5888:5888 dalijolijo/bitcored
```

### CLI Arguments

All CLI arguments are passed directly through to bitcored.

You can use this to configure via CLI args without a config file:

```
docker run -v /home/username/.bitcore:/data \
  -p 5889:5889 \
  -p 127.0.0.1:5888:5888 \
  dalijolijo/bitcored -rpcuser=<USERNAME> -rpcpassword=<PWD>
```

Or just use the container like a bitcored binary:

```
$ docker run dalijolijo/bitcored -version
```

### Version

You can also run a specific version of bitcored if you want.

```
docker run -v /home/username/.bitcore:/data -p 5889:5889 dalijolijo/bitcored:<VERSION>
```

## License

MIT © LIMXTEC
