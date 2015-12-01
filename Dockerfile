FROM ubuntu:latest
ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.6.7
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apt-get update && apt-get -y install wget unzip openssh-client
RUN set -ex \
       && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/$TERRAFORM_ZIP \
       && unzip /tmp/$TERRAFORM_ZIP -d /usr/local/bin \
       && chmod 775 /usr/local/bin/terra* 
RUN apt-get -y purge wget unzip && apt-get autoremove
RUN apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
