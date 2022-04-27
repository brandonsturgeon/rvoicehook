FROM rust:1.60
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS="yes"

RUN apt update && apt install -y cmake clang
RUN rustup install nightly

# Cache cargo dependencies
WORKDIR /work
RUN cargo new app
COPY Cargo.toml /work/app
COPY Cargo.lock /work/app
RUN mkdir -p /work/app/src && touch /work/app/src/lib.rs
WORKDIR /work/app
RUN PKG_CONFIG_ALLOW_CROSS=1 cargo +nightly build --release

WORKDIR /work/app

COPY . .
CMD ["/bin/bash", "entrypoint.sh"]
