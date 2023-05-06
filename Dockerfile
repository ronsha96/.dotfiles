# syntax=docker/dockerfile:experimental

FROM ubuntu:latest

# Essentials
RUN apt update
RUN apt install -y sudo git ansible

# User
ARG user=username
ARG home=/home/username

RUN useradd --create-home --shell /bin/bash --no-log-init $user

USER $user
WORKDIR $home

