FROM alpine:3.3

ENV TERRAFORM_VERSION 0.6.14
ENV GLIBC_VERSION 2.23-r1

RUN apk add --update wget ca-certificates unzip && \
    wget -q "https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
    apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk && \
    wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin && \
    apk del --purge wget ca-certificates unzip && \
    rm -rf /var/cache/apk/* glibc-${GLIBC_VERSION}.apk /terraform.zip

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/terraform"]

CMD ["--help"]
