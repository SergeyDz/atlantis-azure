ARG ATLANTIS
FROM ghcr.io/runatlantis/atlantis:v${ATLANTIS}

RUN apk add --no-cache curl tar openssl sudo bash jq python3
RUN apk --update --no-cache add postgresql-client postgresql
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev python3-pip
RUN pip3 install virtualenv && python3 -m virtualenv /azure-cli

ARG AZURE_CLI_VERSION=2.0.61

RUN /azure-cli/bin/python -m pip --no-cache-dir install azure-cli==${AZURE_CLI_VERSION}
RUN apk add python3 | curl -L https://aka.ms/InstallAzureCli | bash