FROM alpine:3.5

ENV TERRAFORM_VERSION 0.9.11

RUN apk add --update wget ca-certificates unzip git bash && \
    wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin && \
    apk del --purge wget ca-certificates unzip && \
    rm -rf /var/cache/apk/* /terraform.zip

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/terraform"]

CMD ["--help"]
