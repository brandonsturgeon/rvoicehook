FROM rust:1.60
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS="yes"

WORKDIR /app

RUN apt update && apt install -y cmake clang
RUN rustup install nightly

COPY . .
CMD ["/bin/bash", "entrypoint.sh"]
