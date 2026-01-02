# hadolint global ignore=DL3008
FROM docker.io/library/debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends --yes \
      ca-certificates \
      curl \
      git \
      gpg \
      bash \
      dash \
      ksh \
      mksh \
      posh \
      yash \
      zsh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/oksh/Debian_12/ /' > '/etc/apt/sources.list.d/home:Head_on_a_Stick:oksh.list' && \
  curl -fsSL 'https://download.opensuse.org/repositories/home:Head_on_a_Stick:oksh/Debian_12/Release.key' | gpg --dearmor > '/etc/apt/trusted.gpg.d/home_Head_on_a_Stick_oksh.gpg' && \
  apt-get update && \
  apt-get install --no-install-recommends --yes oksh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://git.io/shellspec | sh -s -- --yes --prefix /usr/local

WORKDIR /mnt
