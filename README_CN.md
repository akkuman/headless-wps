# Headless-WPS

在 docker headless 环境中使用 [wps](https://linux.wps.cn/)

## 介绍

该镜像的基础镜像为 `debian:bullseye-slim`

## 使用

你可以将此镜像作为其他镜像的基础镜像

[相关的博客文章](https://hacktech.cn/2023/08/02/2023-08-02-docker-%E4%B8%AD%E4%BD%BF%E7%94%A8-pywpsrpc/)

如果你想使用 wine msoffice2010，你可以试试 [docker-msoffice2010-python](https://github.com/akkuman/docker-msoffice2010-python)，但经过我测试，这个不够稳定，经常性卡住，原因不明

### 样例

查看[例子](example)

## 参考链接

- [pywpsrpc](https://github.com/timxx/pywpsrpc)
