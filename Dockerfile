FROM busybox

ENV TERRAFORM_VERSION 0.4.2

RUN mkdir /terraform && \
    wget -O /terraform.zip http://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /terraform.zip -d /terraform && \
    rm -f /terraform.zip

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/terraform/terraform"]

CMD ["--help"]
