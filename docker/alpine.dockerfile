FROM docker.io/library/alpine:3

# hadolint ignore=DL3018
RUN apk add --no-cache \
  autoconf \
  automake \
  build-base \
  git \
  make \
  bash \
  dash \
  loksh \
  mksh \
  oksh \
  yash \
  zsh \
  shellspec

WORKDIR /build

# hadolint ignore=DL3003
RUN git clone https://salsa.debian.org/clint/posh.git && \
  cd posh && \
  autoreconf -fi && \
  ./configure --prefix=/usr --mandir=/usr/share/man && \
  make && \
  make install && \
  cd .. && \
  rm -r ./posh

WORKDIR /mnt
