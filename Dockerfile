ARG VARIANT=3.9
FROM python:$VARIANT-slim-bullseye as prod

ENV container=docker
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Install packages
RUN apt-get update && \ 
  DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --no-install-recommends \
  ssh \
  sshpass \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*/ var/tmp/*

RUN pip install pip --upgrade
RUN pip install ansible jc
RUN ansible-galaxy collection install community.general