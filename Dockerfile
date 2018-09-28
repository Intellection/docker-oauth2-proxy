FROM debian:stretch-slim

ARG OAUTH2_PROXY_VERSION="2.2"
ARG OAUTH2_PROXY_GOLANG_VERSION="1.8.1"
ARG OAUTH2_PROXY_PKG_VERSION="2.2.0"
ARG OAUTH2_PROXY_PKG="oauth2_proxy-${OAUTH2_PROXY_PKG_VERSION}.linux-amd64.go${OAUTH2_PROXY_GOLANG_VERSION}"
ARG OAUTH2_PROXY_SHA="1c16698ed0c85aa47aeb80e608f723835d9d1a8b98bd9ae36a514826b3acce56"

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
      ca-certificates wget && \
    mkdir -p /var/tmp/oauth2_proxy && \
    cd /var/tmp/oauth2_proxy && \
    wget --progress=dot:mega https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_VERSION}/${OAUTH2_PROXY_PKG}.tar.gz && \
    echo "${OAUTH2_PROXY_SHA} *${OAUTH2_PROXY_PKG}.tar.gz" | sha256sum -c - && \
    tar xvf ${OAUTH2_PROXY_PKG}.tar.gz && \
    cp /var/tmp/oauth2_proxy/${OAUTH2_PROXY_PKG}/oauth2_proxy /bin/ && \
    rm -rf /tmp/* /var/{cache,log,tmp} /var/lib/{apt,dpkg,cache,log}

EXPOSE 4180

ENTRYPOINT ["oauth2_proxy"]
