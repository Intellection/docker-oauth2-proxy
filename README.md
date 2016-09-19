# Docker OAuth2 Proxy

[![CircleCI](https://circleci.com/gh/Intellection/docker-oauth2-proxy/tree/master.svg?style=shield)](https://circleci.com/gh/Intellection/docker-oauth2-proxy/tree/master)

This is a small docker image for `oauth2_proxy` which is a reverse proxy that provides authentication with Google, GitHub or other providers.

## Configuration

Configure OAuth2 Proxy using [config file][2], [command line options][3], or [environment variables][4]. See [`bitly/oauth2_proxy` documentation][1] for more details.

## Usage

Protect an upstream service e.g. `http://someservice:1234` using Google as the provider (default) but limited to `yourdomain.com` email addresses:

    $ docker run \
        -p 4180:4180 \
        -e OAUTH2_PROXY_CLIENT_ID="SOME_CLIENT_ID" \
        -e OAUTH2_PROXY_CLIENT_SECRET="SOME_CLIENT_SECRET" \
        -e OAUTH2_PROXY_COOKIE_SECRET="SOME_COOKIE_SECRET" \
        zappi/oauth2_proxy:2.1 \
        -—upstream=http://someservice:1234 \
        -—http-address=0.0.0.0:4180 \
        -—email-domain=yourdomain.com

[1]: https://github.com/bitly/oauth2_proxy
[2]: https://github.com/bitly/oauth2_proxy/tree/v2.1#config-file
[3]: https://github.com/bitly/oauth2_proxy/tree/v2.1#command-line-options
[4]: https://github.com/bitly/oauth2_proxy/tree/v2.1#environment-variables
