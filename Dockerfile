# Dockerfile

FROM alpine

RUN apk add --no-cache bash curl

RUN DRAFT=$(curl -s https://api.github.com/repos/Azure/draft/releases/latest | grep tag_name | cut -d'"' -f4) && \
    curl -sL https://azuredraft.blob.core.windows.net/draft/draft-${DRAFT}-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/draft /usr/local/bin/draft

ENTRYPOINT ["bash"]
