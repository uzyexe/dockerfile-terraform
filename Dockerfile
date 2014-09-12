FROM progrium/busybox

ENV TERRAFORM_VERSION 0.2.2
RUN mkdir /terraform
RUN wget -P /terraform -O /terraform.zip http://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    cd /terraform && unzip /terraform.zip

WORKDIR /data
ENTRYPOINT ["/terraform/terraform"]
