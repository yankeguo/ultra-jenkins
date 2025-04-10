FROM alpine/curl AS battery-node-14

RUN curl -sSLo node.tar.gz "https://mirrors.cloud.tencent.com/nodejs-release/v14.21.3/node-v14.21.3-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-14" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-14" && \
    rm -rf node.tar.gz && echo 'export PATH=/opt/node-14/bin:$PATH' >> /opt/activate-node-14 && \
    chmod +x /opt/activate-node-14

FROM alpine/curl AS battery-node-16

RUN curl -sSLo node.tar.gz "https://mirrors.cloud.tencent.com/nodejs-release/v16.20.2/node-v16.20.2-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-16" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-16" && \
    rm -rf node.tar.gz && echo 'export PATH=/opt/node-16/bin:$PATH' >> /opt/activate-node-16 && \
    chmod +x /opt/activate-node-16

FROM alpine/curl AS battery-node-18

RUN curl -sSLo node.tar.gz "https://mirrors.cloud.tencent.com/nodejs-release/v18.20.8/node-v18.20.8-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-18" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-18" && \
    rm -rf node.tar.gz && echo 'export PATH=/opt/node-18/bin:$PATH' >> /opt/activate-node-18 && \
    chmod +x /opt/activate-node-18

FROM alpine/curl AS battery-node-20

RUN curl -sSLo node.tar.gz "https://mirrors.cloud.tencent.com/nodejs-release/v20.19.0/node-v20.19.0-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-20" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-20" && \
    rm -rf node.tar.gz && echo 'export PATH=/opt/node-20/bin:$PATH' >> /opt/activate-node-20 && \
    chmod +x /opt/activate-node-20

FROM alpine/curl AS battery-node-22

RUN curl -sSLo node.tar.gz "https://mirrors.cloud.tencent.com/nodejs-release/v22.14.0/node-v22.14.0-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-22" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-22" && \
    rm -rf node.tar.gz && echo 'export PATH=/opt/node-22/bin:$PATH' >> /opt/activate-node-22 && \
    chmod +x /opt/activate-node-22



FROM ubuntu:24.04

ENV LANG=zh_CN.UTF-8
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/archive.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i 's/security.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list.d/ubuntu.sources && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential ca-certificates curl docker.io git locales locales-all openjdk-21-jdk-headless openssh-client p7zip-full python3 python3-pip python3-venv rsync tini tzdata unzip zstd && \
    rm -rf /var/lib/apt/lists/* && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN git config --global --add safe.directory '*' && \
    git config --global init.defaultBranch main


COPY --from=battery-node-14 /opt/node-14 /opt/node-14
COPY --from=battery-node-14 /opt/activate-node-14 /opt/activate-node-14

COPY --from=battery-node-16 /opt/node-16 /opt/node-16
COPY --from=battery-node-16 /opt/activate-node-16 /opt/activate-node-16

COPY --from=battery-node-18 /opt/node-18 /opt/node-18
COPY --from=battery-node-18 /opt/activate-node-18 /opt/activate-node-18

COPY --from=battery-node-20 /opt/node-20 /opt/node-20
COPY --from=battery-node-20 /opt/activate-node-20 /opt/activate-node-20

COPY --from=battery-node-22 /opt/node-22 /opt/node-22
COPY --from=battery-node-22 /opt/activate-node-22 /opt/activate-node-22


EXPOSE 8080

ENTRYPOINT [ "tini", "--" ]

CMD ["java", "-server", "-Xms1024m", "-Xmx1024m", "-jar", "/opt/jenkins.war"]