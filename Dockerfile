FROM alpine:3.2

ENV TERRAFORM_VERSION 0.6.3

RUN apk add --update bash wget ca-certificates unzip && \
    wget --no-check-certificate "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-2.21-r2.apk && \
    rm -rf /var/cache/apk/*

RUN mkdir /terraform && \
    wget -O /terraform.zip http://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /terraform.zip -d /terraform && \
    rm -f /terraform.zip

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/terraform/terraform"]

CMD ["--help"]
