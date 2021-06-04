FROM rust:1-slim
ARG MDBOOK_VERSION="0.4.9"

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

# Install mdbook-graphviz from source
WORKDIR /deps
RUN git clone https://github.com/dylanowen/mdbook-graphviz/

WORKDIR /deps/mdbook-graphviz/

RUN cargo build && cargo install --force --path .

# Install homebrew dependencies
RUN apt-get update \
      && apt-get install -y build-essential curl file git \
      && rm -rf /var/lib/apt/lists/*

# Install homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install graphviz via homebrew
RUN brew install graphviz

WORKDIR /data
VOLUME ["/data"]
