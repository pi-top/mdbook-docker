FROM rust:1-slim
ARG MDBOOK_VERSION="0.4.9"

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

RUN cargo install mdbook-graphviz

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
