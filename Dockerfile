FROM alpine:3.3

ENV TERRAFORM_VERSION 0.6.10
ENV TERRAFORM_SHA256SUM d7c07e2bf587257673bae710c776430a8cc5a755a9ad4a2cbae066d0cd02a862

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
