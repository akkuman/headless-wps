FROM debian:bookworm-slim AS finally

LABEL maintainer="Akkuman<akkumans@qq.com> (http://akkuman.cnblogs.com,https://www.hacktech.cn)"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai

WORKDIR /root

RUN apt update && \
    apt-get install -y wget bsdmainutils xdg-utils libxslt1.1 xvfb libqt5gui5 python3 binutils && \
    # https://github.com/timxx/pywpsrpc/issues/39#issuecomment-2826545906
    # https://github.com/timxx/pywpsrpc/issues/111#issuecomment-3209649920
    strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5 && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    wget https://github.com/Rongronggg9/wps-office-repack/releases/download/v12.1.2.22571/wps-office_12.1.2.22571.AK.preread.sw_480057_amd64.deb && \
    apt install -y ./wps-office_12.1.2.22571.AK.preread.sw_480057_amd64.deb && \
    rm -rf ./wps-office_12.1.2.22571.AK.preread.sw_480057_amd64.deb && \
    # download fonts
    # https://github.com/timxx/pywpsrpc/issues/29#issuecomment-2014727973
    wget -P /usr/share/fonts/ https://raw.githubusercontent.com/iykrichie/wps-office-19-missing-fonts-on-Linux/refs/heads/main/WEBDINGS.TTF && \
    wget -P /usr/share/fonts/ https://raw.githubusercontent.com/iykrichie/wps-office-19-missing-fonts-on-Linux/refs/heads/main/WINGDNG2.ttf && \
    wget -P /usr/share/fonts/ https://raw.githubusercontent.com/iykrichie/wps-office-19-missing-fonts-on-Linux/refs/heads/main/WINGDNG3.ttf && \
    wget -P /usr/share/fonts/ https://raw.githubusercontent.com/iykrichie/wps-office-19-missing-fonts-on-Linux/refs/heads/main/mtextra.ttf && \
    wget -P /usr/share/fonts/ https://raw.githubusercontent.com/iykrichie/wps-office-19-missing-fonts-on-Linux/refs/heads/main/symbol.ttf && \
    wget -P /usr/share/fonts/ https://raw.githubusercontent.com/iykrichie/wps-office-19-missing-fonts-on-Linux/refs/heads/main/wingding.ttf && \
    fc-cache -f -v && \
    mkdir -p /root/.config/Kingsoft/ && \
    mkdir -p /root/.config/Kingsoft/ && \
    # Cleaning cache:
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# disable wpscloudsvr zombie process
RUN chmod -x /opt/kingsoft/wps-office/office6/wpscloudsvr

COPY Office.conf /root/.config/Kingsoft/Office.conf
COPY entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]