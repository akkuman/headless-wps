FROM debian:bullseye-slim AS finally

LABEL maintainer="Akkuman<akkumans@qq.com> (http://akkuman.cnblogs.com,https://www.hacktech.cn)"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai

WORKDIR /root

RUN apt update && \
    apt-get install -y wget bsdmainutils xdg-utils libxslt1.1 xvfb libqt5gui5 python3 && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    wget https://github.com/Rongronggg9/wps-office-repack/releases/download/v12.1.2.22570/wps-office_12.1.2.22570.AK.preread.sw_474164_amd64.deb && \
    apt install -y ./wps-office_12.1.2.22570.AK.preread.sw_474164_amd64.deb && \
    rm -rf ./wps-office_12.1.2.22570.AK.preread.sw_474164_amd64.deb && \
    mkdir -p /root/.config/Kingsoft/ && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# disable wpscloudsvr zombie process
RUN chmod -x /opt/kingsoft/wps-office/office6/wpscloudsvr && \

COPY Office.conf /root/.config/Kingsoft/Office.conf
COPY entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]