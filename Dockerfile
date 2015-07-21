FROM debian:wheezy

ENV TERRAFORM_VERSION 0.6.1

RUN apt-get update -qq && \
    apt-get install -qy wget unzip && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /terraform && \
    wget -O /terraform.zip http://dl.bintray.com/mitchellh/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /terraform.zip -d /terraform && \
    rm -f /terraform.zip
 
VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/terraform/terraform"]

CMD ["--help"]
