# syntax=docker/dockerfile:experimental

FROM opensuse/tumbleweed:latest
RUN zypper ref && zypper up -y
RUN zypper in -y git
RUN zypper clean --all
