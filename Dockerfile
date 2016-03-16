FROM alpine:3.3

ENV TERRAFORM_VERSION 0.6.13
ENV TERRAFORM_SHA256SUM 8eeddca53958d5c871de93a624eb0f5971f97cbaf107e0b2d1cc289f2ac21b79

RUN apk add --update wget ca-certificates unzip git mercurial && \
    wget -q "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-2.21-r2.apk && \
    wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    echo "${TERRAFORM_SHA256SUM}  /terraform.zip" | sha256sum -c && \
    unzip /terraform.zip -d /bin && \
    apk del --purge wget ca-certificates unzip && \
    rm -rf /var/cache/apk/* glibc-2.21-r2.apk /terraform.zip

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/terraform"]

CMD ["--help"]
