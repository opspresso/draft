# Dockerfile

FROM python:slim

RUN apt-get update && \
    apt-get install -y git curl zip jq

RUN DRAFT=$(curl -s https://api.github.com/repos/Azure/draft/releases/latest | jq -r '.tag_name') && \
    curl -sL https://azuredraft.blob.core.windows.net/draft/draft-${DRAFT}-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/draft /usr/local/bin/draft

ENTRYPOINT ["bash"]
