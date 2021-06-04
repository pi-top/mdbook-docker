FROM rust:1-slim
ARG MDBOOK_VERSION="0.4.9"

RUN apt-get update \
      && apt-get install -y graphviz \
      && rm -rf /var/lib/apt/lists/*

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

RUN cargo install mdbook-graphviz

WORKDIR /data
VOLUME ["/data"]
