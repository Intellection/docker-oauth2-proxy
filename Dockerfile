FROM debian:stretch-slim

ARG OAUTH2_PROXY_VERSION="2.1"
ARG OAUTH2_PROXY_GOLANG_VERSION="1.6"
ARG OAUTH2_PROXY_PKG="oauth2_proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.go${OAUTH2_PROXY_GOLANG_VERSION}"
ARG OAUTH2_PROXY_SHA="3061e5b04bd14eeb9ec0ad1c9b324ba8d99d50eaadc5f528cdf4d21043828298"

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
      ca-certificates wget && \
    rm -rf /tmp/* /var/{cache,log,tmp} /var/lib/{apt,dpkg,cache,log}

RUN mkdir -p /var/tmp/oauth2_proxy && \
    cd /var/tmp/oauth2_proxy && \
    wget --progress=dot:mega https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_VERSION}/${OAUTH2_PROXY_PKG}.tar.gz && \
    echo "${OAUTH2_PROXY_SHA} *${OAUTH2_PROXY_PKG}.tar.gz" | sha256sum -c - && \
    tar xvf ${OAUTH2_PROXY_PKG}.tar.gz && \
    cp /var/tmp/oauth2_proxy/${OAUTH2_PROXY_PKG}/oauth2_proxy /bin/

EXPOSE 4180

ENTRYPOINT ["oauth2_proxy"]
