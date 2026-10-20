FROM alpine:latest
RUN apk update && apk add --no-cache \
    build-base \
    git \
    automake \
    autoconf \
    libtool \
    pkgconf \
    curl \
    libcurl \
    openssl-dev \
    bash
RUN git clone https://github.com/tpruvot/cpuminer-multi.git /tmp/cpuminer && \
    cd /tmp/cpuminer && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 10000
ENTRYPOINT ["/entrypoint.sh"]
