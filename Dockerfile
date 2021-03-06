FROM bitnami/minideb AS builder

ENV ZOLA_VERSION v0.12.2

RUN install_packages python-pip curl tar python-setuptools rsync binutils
RUN pip install dockerize

WORKDIR /workdir

RUN curl -L https://github.com/getzola/zola/releases/download/$ZOLA_VERSION/zola-$ZOLA_VERSION-x86_64-unknown-linux-gnu.tar.gz | tar xz
RUN mv zola /usr/bin
RUN dockerize -n --verbose -o /workdir  /usr/bin/zola

FROM debian:buster-slim

COPY --from=builder /workdir .