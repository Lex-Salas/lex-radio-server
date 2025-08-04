FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    icecast2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY icecast.xml /etc/icecast2/icecast.xml

RUN chmod 644 /etc/icecast2/icecast.xml && \
    mkdir -p /var/log/icecast2 && \
    chmod 755 /var/log/icecast2

EXPOSE 8000

CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml", "-b"]
