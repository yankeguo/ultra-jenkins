FROM alpine/curl AS battery-node-14

RUN curl -sSLo node.tar.gz "https://nodejs.org/dist/v14.21.3/node-v14.21.3-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-14" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-14" && \
    rm -rf node.tar.gz && echo 'export PATH="/opt/node-14/bin:$PATH"' >> /opt/activate-node-14 && \
    chmod +x /opt/activate-node-14

FROM alpine/curl AS battery-node-16

RUN curl -sSLo node.tar.gz "https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-16" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-16" && \
    rm -rf node.tar.gz && echo 'export PATH="/opt/node-16/bin:$PATH"' >> /opt/activate-node-16 && \
    chmod +x /opt/activate-node-16

FROM alpine/curl AS battery-node-18

RUN curl -sSLo node.tar.gz "https://nodejs.org/dist/v18.20.8/node-v18.20.8-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-18" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-18" && \
    rm -rf node.tar.gz && echo 'export PATH="/opt/node-18/bin:$PATH"' >> /opt/activate-node-18 && \
    chmod +x /opt/activate-node-18

FROM alpine/curl AS battery-node-20

RUN curl -sSLo node.tar.gz "https://nodejs.org/dist/v20.19.0/node-v20.19.0-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-20" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-20" && \
    rm -rf node.tar.gz && echo 'export PATH="/opt/node-20/bin:$PATH"' >> /opt/activate-node-20 && \
    chmod +x /opt/activate-node-20

FROM alpine/curl AS battery-node-22

RUN curl -sSLo node.tar.gz "https://nodejs.org/dist/v22.14.0/node-v22.14.0-linux-x64.tar.gz" && \
    mkdir -p "/opt/node-22" && tar -xf node.tar.gz --strip-components 1 -C "/opt/node-22" && \
    rm -rf node.tar.gz && echo 'export PATH="/opt/node-22/bin:$PATH"' >> /opt/activate-node-22 && \
    chmod +x /opt/activate-node-22

FROM alpine/curl AS battery-maven-3_6

RUN curl -sSLo maven.tar.gz "https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz" && \
    mkdir -p "/opt/maven-3.6" && tar -xf maven.tar.gz --strip-components 1 -C "/opt/maven-3.6" && \
    rm -rf maven.tar.gz && echo 'export PATH="/opt/maven-3.6/bin:$PATH"' >> /opt/activate-maven-3.6 && \
    chmod +x /opt/activate-maven-3.6

FROM alpine/curl AS battery-maven-3_8

RUN curl -sSLo maven.tar.gz "https://archive.apache.org/dist/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz" && \
    mkdir -p "/opt/maven-3.8" && tar -xf maven.tar.gz --strip-components 1 -C "/opt/maven-3.8" && \
    rm -rf maven.tar.gz && echo 'export PATH="/opt/maven-3.8/bin:$PATH"' >> /opt/activate-maven-3.8 && \
    chmod +x /opt/activate-maven-3.8

FROM alpine/curl AS battery-maven-3_9

RUN curl -sSLo maven.tar.gz "https://archive.apache.org/dist/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz" && \
    mkdir -p "/opt/maven-3.9" && tar -xf maven.tar.gz --strip-components 1 -C "/opt/maven-3.9" && \
    rm -rf maven.tar.gz && echo 'export PATH="/opt/maven-3.9/bin:$PATH"' >> /opt/activate-maven-3.9 && \
    chmod +x /opt/activate-maven-3.9

FROM alpine/curl AS battery-jdk-8

RUN curl -sSLo jdk.tar.gz "https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u442-b06/OpenJDK8U-jdk_x64_linux_hotspot_8u442b06.tar.gz" && \
    mkdir -p "/opt/jdk-8" && tar -xf jdk.tar.gz --strip-components 1 -C "/opt/jdk-8" && \
    rm -rf jdk.tar.gz && echo -e 'export PATH="/opt/jdk-8/bin:$PATH"\nexport JAVA_HOME="/opt/jdk-8"' >> /opt/activate-jdk-8 && \
    chmod +x /opt/activate-jdk-8

FROM alpine/curl AS battery-jdk-11

RUN curl -sSLo jdk.tar.gz "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.26%2B4/OpenJDK11U-jdk_x64_linux_hotspot_11.0.26_4.tar.gz" && \
    mkdir -p "/opt/jdk-11" && tar -xf jdk.tar.gz --strip-components 1 -C "/opt/jdk-11" && \
    rm -rf jdk.tar.gz && echo -e 'export PATH="/opt/jdk-11/bin:$PATH"\nexport JAVA_HOME="/opt/jdk-11"' >> /opt/activate-jdk-11 && \
    chmod +x /opt/activate-jdk-11

FROM alpine/curl AS battery-jdk-17

RUN curl -sSLo jdk.tar.gz "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.9%2B9/OpenJDK17U-jdk_x64_linux_hotspot_17.0.9_9.tar.gz" && \
    mkdir -p "/opt/jdk-17" && tar -xf jdk.tar.gz --strip-components 1 -C "/opt/jdk-17" && \
    rm -rf jdk.tar.gz && echo -e 'export PATH="/opt/jdk-17/bin:$PATH"\nexport JAVA_HOME="/opt/jdk-17"' >> /opt/activate-jdk-17 && \
    chmod +x /opt/activate-jdk-17

FROM alpine/curl AS battery-jdk-21

RUN curl -sSLo jdk.tar.gz "https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.6%2B7/OpenJDK21U-jdk_x64_linux_hotspot_21.0.6_7.tar.gz" && \
    mkdir -p "/opt/jdk-21" && tar -xf jdk.tar.gz --strip-components 1 -C "/opt/jdk-21" && \
    rm -rf jdk.tar.gz && echo -e 'export PATH="/opt/jdk-21/bin:$PATH"\nexport JAVA_HOME="/opt/jdk-21"' >> /opt/activate-jdk-21 && \
    chmod +x /opt/activate-jdk-21


FROM alpine/curl AS battery-jenkins

RUN curl -sSLo /opt/jenkins.war "https://get.jenkins.io/war-stable/2.492.3/jenkins.war"

FROM ubuntu:24.04

ENV LANG=zh_CN.UTF-8
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential ca-certificates curl git locales locales-all openjdk-21-jdk-headless openssh-client python3 python3-pip python3-venv rsync tini tzdata unzip && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-buildx-plugin docker-compose-plugin && \
    rm -rf /var/lib/apt/lists/*

COPY --from=battery-jenkins /opt/jenkins.war /opt/jenkins.war


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


COPY --from=battery-maven-3_6 /opt/maven-3.6 /opt/maven-3.6
COPY --from=battery-maven-3_6 /opt/activate-maven-3.6 /opt/activate-maven-3.6

COPY --from=battery-maven-3_8 /opt/maven-3.8 /opt/maven-3.8
COPY --from=battery-maven-3_8 /opt/activate-maven-3.8 /opt/activate-maven-3.8

COPY --from=battery-maven-3_9 /opt/maven-3.9 /opt/maven-3.9
COPY --from=battery-maven-3_9 /opt/activate-maven-3.9 /opt/activate-maven-3.9


COPY --from=battery-jdk-8 /opt/jdk-8 /opt/jdk-8
COPY --from=battery-jdk-8 /opt/activate-jdk-8 /opt/activate-jdk-8

COPY --from=battery-jdk-11 /opt/jdk-11 /opt/jdk-11
COPY --from=battery-jdk-11 /opt/activate-jdk-11 /opt/activate-jdk-11

COPY --from=battery-jdk-17 /opt/jdk-17 /opt/jdk-17
COPY --from=battery-jdk-17 /opt/activate-jdk-17 /opt/activate-jdk-17

COPY --from=battery-jdk-21 /opt/jdk-21 /opt/jdk-21
COPY --from=battery-jdk-21 /opt/activate-jdk-21 /opt/activate-jdk-21


EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]

ADD run.sh /run.sh

CMD [ "/run.sh" ]