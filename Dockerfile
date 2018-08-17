# Dockerfile

FROM alpine

RUN apk add --no-cache bash curl

ENV VERSION=v0.15.01
RUN curl -sL https://azuredraft.blob.core.windows.net/draft/draft-${VERSION=v0.15.0}-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/draft /usr/local/bin/draft

ENTRYPOINT ["bash"]
