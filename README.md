# Docker OAuth2 Proxy

This is a small docker image for `oauth2_proxy` which is a reverse proxy
that provides authentication with Google, Github or other providers.

## Configuration

Configure OAuth2 Proxy using config file, command line options, or
environment variables. See [`bitly/oauth2_proxy` documentation][1] for
more details.

## Usage

Get a `bash` shell from the container

    $ docker run zappi/oauth2_proxy --version

[1]: https://github.com/bitly/oauth2_proxy
