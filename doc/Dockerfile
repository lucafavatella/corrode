FROM debian:buster-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    texlive \
    lmodern \
 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["pandoc"]
