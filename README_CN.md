# Headless-WPS

在 docker headless 环境中使用 [wps](https://linux.wps.cn/)

## 介绍

该镜像的基础镜像为 `debian:bullseye-slim`

## 使用

你可以将此镜像作为其他镜像的基础镜像

### 样例

```Dockerfile
FROM akkuman/headless-wps

RUN apt update && apt install libqt5xml5 python3 python3-pip

RUN python3 -m pip --no-cache-dir --no-compile install pywpsrpc

COPY example.py /root/example.py

CMD ["xvfb-run", "python3", "example.py"]
```
