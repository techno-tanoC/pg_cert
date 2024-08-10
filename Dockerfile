FROM ubuntu:24.04

RUN <<EOF
  apt update
  apt install -y postgresql-client
EOF
