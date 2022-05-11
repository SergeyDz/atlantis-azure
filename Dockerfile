ARG ATLANTIS

FROM ghcr.io/runatlantis/atlantis:v${ATLANTIS}

RUN apk add py3-pip
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install --upgrade pip
RUN pip install azure-cli

ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.36.8/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt

ADD https://github.com/env0/terratag/releases/download/v0.1.37/terratag_0.1.37_linux_arm64.tar.gz /tmp/terratag_0.1.37_linux_arm64.tar.gz
RUN tar -xvf /tmp/terratag_0.1.37_linux_arm64.tar.g -C /usr/local/bin/terratag
RUN chmod +x /usr/local/bin/terratag
