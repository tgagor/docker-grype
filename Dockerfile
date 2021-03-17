FROM alpine:3
MAINTAINER tgagor, https://github.com/tgagor

ARG GRYPE_VERSION=v0.8.0
RUN apk add --no-cache curl && \
    curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | \
        sh -s -- -d -b /usr/local/bin $GRYPE_VERSION && \
    apk del curl

COPY grype.yaml /var/lib/grype/.grype.yaml
WORKDIR /var/lib/grype
VOLUME ["/var/lib/grype"]
ENTRYPOINT ["/usr/local/bin/grype"]
