FROM alpine:edge

MAINTAINER Nikolauska <nikolauska1@gmail.com>

ENV VERSION v0.2.1

RUN apk -U upgrade && apk --update --no-cache add wget tar nodejs && \
    wget https://github.com/Keats/gutenberg/releases/download/${VERSION}/gutenberg-${VERSION}-x86_64-unknown-linux-gnu.tar.gz -O gutenberg.tar.gz && \
    mkdir -p /opt/gutenberg-${VERSION} && \
    tar -xzf gutenberg.tar.gz -C /opt/gutenberg-${VERSION}/ && \
    rm gutenberg.tar.gz && \
    rm -rf /var/cache/apk/*

ENV PATH $PATH:node_modules/.bin:/opt/gutenberg-${VERSION}

CMD ["sh", "-c", "gutenberg serve"]