ARG ATLANTIS
FROM ghcr.io/runatlantis/atlantis:v${ATLANTIS}

RUN apk add \
    aws-cli \
    curl \
    make \
    unzip

RUN apk add python3 | curl -L https://aka.ms/InstallAzureCli | bash