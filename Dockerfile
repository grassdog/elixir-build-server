FROM elixir:1.5.2

# Docker file to create a build server
# Reference: https://github.com/appdojolabs/myapp/blob/master/docker/Dockerfile

LABEL maintainer="ray.grasso@gmail.com"

ENV REFRESHED_AT=2017-12-10

# Avoid error messages from apt during image build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server wget curl git locales

RUN mkdir /var/run/sshd

ENV LANG=C.UTF-8
RUN update-locale LANG=$LANG

# Create Builder user
RUN useradd --system --shell=/bin/bash --create-home builder

# Config builder user for public key authentication
RUN mkdir /home/builder/.ssh/ && chmod 700 /home/builder/.ssh/
COPY ./id_rsa.pub /home/builder/.ssh/authorized_keys
RUN chown -R builder /home/builder/
RUN chgrp -R builder /home/builder/
RUN chmod 700 /home/builder/.ssh/
RUN chmod 644 /home/builder/.ssh/authorized_keys

# Configure public keys for sshd
RUN  echo "AuthorizedKeysFile  %h/.ssh/authorized_keys" >> /etc/ssh/sshd_config

ENV MIX_ENV=prod

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
