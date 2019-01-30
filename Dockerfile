FROM debian:stable-slim
LABEL maintainer="LIMXTEC developer"

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp
COPY ./CHECKSUM /tmp

RUN VERSION=`cat /tmp/VERSION` && \
    chmod a+x /usr/local/bin/* && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates tar && \
    curl -L https://github.com/LIMXTEC/BitCore/releases/download/$VERSION/linux.Ubuntu.16.04.LTS-static-libstdc.tar.gz --output /tmp/prebuilt.tar.gz && \
    echo "$(cat /tmp/CHECKSUM)  /tmp/prebuilt.tar.gz" | sha256sum -c && \
    tar xzf /tmp/prebuilt.tar.gz -C /tmp/ && \
    mv /tmp/bitcored /usr/local/bin && \
    apt-get purge -y curl ca-certificates tar && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/data"]
ENV HOME /data
ENV DATA /data
WORKDIR /data

EXPOSE 5888 5889

ENTRYPOINT ["init"]
