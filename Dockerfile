FROM debian:bullseye-slim AS finally

LABEL maintainer="Akkuman<akkumans@qq.com> (http://akkuman.cnblogs.com,https://hacktech.cn)"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai

WORKDIR /root

RUN apt update && \
    apt-get install -y wget bsdmainutils xdg-utils libxslt1.1 xvfb libqt5gui5 && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    wget https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/11698/wps-office_11.1.0.11698_amd64.deb && \
    apt install -y ./wps-office_11.1.0.11698_amd64.deb && \
    rm -rf ./wps-office_11.1.0.11698_amd64.deb && \
    mkdir -p /root/.config/Kingsoft/ && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

COPY Office.conf /root/.config/Kingsoft/Office.conf
COPY entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]