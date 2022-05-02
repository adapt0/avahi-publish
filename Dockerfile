FROM debian:stable-slim
RUN apt update \
    && apt install -y avahi-utils \
    && rm -rf /var/lib/apt/lists/*
COPY publish.sh /usr/local/bin/publish.sh
ENTRYPOINT ["/usr/local/bin/publish.sh"]
