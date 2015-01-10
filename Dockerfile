FROM busybox

ENV TERRAFORM_VERSION 0.3.6
RUN mkdir /terraform \
    && wget -P /terraform -O /terraform.zip http://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && cd /terraform && unzip /terraform.zip && rm -f /terraform.zip

WORKDIR /data

ENTRYPOINT ["/terraform/terraform"]
