FROM alpine:3.4

ENV BUILD_PKGS="ca-certificates wget"

ENV OAUTH2_PROXY_VERSION="2.1"
ENV OAUTH2_PROXY_PKG="oauth2_proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.go1.6"
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PKGS && \
    mkdir -p /var/tmp/oauth2_proxy && \
    cd /var/tmp/oauth2_proxy && \
    wget --progress=dot:mega https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_VERSION}/${OAUTH2_PROXY_PKG}.tar.gz && \
    tar xvf ${OAUTH2_PROXY_PKG}.tar.gz && \
    cp /var/tmp/oauth2_proxy/${OAUTH2_PROXY_PKG}/oauth2_proxy /bin/ && \
    apk del $BUILD_PKGS && \
    rm -rf /var/cache/apk/*

EXPOSE 4180

ENTRYPOINT ["oauth2_proxy"]
