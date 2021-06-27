FROM rust:1.51 AS builder

WORKDIR /app

COPY Cargo.toml Cargo.toml
COPY Cargo.lock Cargo.lock
COPY ./src ./src

RUN cargo build --release

# for release
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY --from=builder /akogare/target/release/Lindera-api /usr/local/bin/Lindera-api

RUN mkdir /usr/local/lib/lindera/
COPY lindera-ipadic-2.7.0-20070801-neologd-20200910 /usr/local/lib/lindera/lindera-ipadic-2.7.0-20070801-neologd-20200910/

CMD ["/usr/local/bin/Lindera-api"]

