# syntax=docker/dockerfile:experimental

FROM alpine:latest

# Essentials
RUN apk add --no-cache sudo bash git ansible

# User
ARG user=username
ARG home=/home/username

RUN addgroup -S docker

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home $home \
    --ingroup docker \
    $user

USER $user
WORKDIR $home
