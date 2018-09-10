FROM alpine:3.8

# Chamber installation
ARG CHAMBER_VERSION=2.1.0
ARG CHAMBER_SHA256SUM=c85bf50f0bbb7db4fe00a1467337b07973f3680c40e808f124b08f437d493eea

RUN mkdir /shared

RUN apk update && apk upgrade && apk add  --no-cache ca-certificates wget && update-ca-certificates \
    && wget https://github.com//segmentio/chamber/releases/download/v${CHAMBER_VERSION}/chamber-v${CHAMBER_VERSION}-linux-amd64 -O /shared/chamber \
    && chmod +x /shared/chamber \
    && echo "${CHAMBER_SHA256SUM}  /shared/chamber" > /shared/chamber_SHA256SUMS \
    && sha256sum -c /shared/chamber_SHA256SUMS \
    && rm -rf /var/cache/apk/* \
    && rm /shared/chamber_SHA256SUMS
