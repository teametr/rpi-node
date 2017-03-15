FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 7.7.2

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-armv7l.tar.gz" \
  && tar -xzf "node-v$NODE_VERSION-linux-armv7l.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-armv7l.tar.gz"

CMD [ "node" ]
