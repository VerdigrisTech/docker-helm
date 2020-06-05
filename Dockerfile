FROM debian:buster-slim AS builder

ARG HELM_VERSION=v3.2.2
ARG KUBECTL_VERSION=v1.18.3

WORKDIR /tmp
RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xvz

FROM verdigristech/kubectl:v1.18.3
COPY --from=builder /tmp/linux-amd64/helm /usr/bin/
ENTRYPOINT [ "helm" ]
