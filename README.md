# Docker OAuth2 Proxy

This is a small docker image for `oauth2_proxy` which is a reverse proxy
that provides authentication with Google, GitHub or other providers.

## Configuration

Configure OAuth2 Proxy using config file, command line options, or
environment variables. See [`bitly/oauth2_proxy` documentation][1] for
more details.

## Usage

Run without parameters or any configuration:

    # Will error out because of no configuration
    $ docker run zappi/oauth2_proxy
    2016/09/16 10:19:26 main.go:99: Invalid configuration:
      missing setting: upstream
      missing setting: cookie-secret
      missing setting: client-id
      missing setting: client-secret
      missing setting for email validation: email-domain or authenticated-emails-file required.
          use email-domain=* to authorize all email addresses

Check version:

    $ docker run zappi/oauth2_proxy --version

[1]: https://github.com/bitly/oauth2_proxy
