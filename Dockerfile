# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM  node:12-buster-slim

LABEL author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN   apt update \
   && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils \
      build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev \
   && useradd -m -d /home/container container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD  ["/bin/bash", "/entrypoint.sh"]
