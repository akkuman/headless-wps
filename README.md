# Headless-WPS

[中文版本](./README_CN.md)

run [wps](https://linux.wps.cn/) in headless docker

## Intro

the base image of this image(`akkuman/headless-wps`) is `debian:bullseye-slim`

[blog article](https://hacktech.cn/2023/08/02/2023-08-02-docker-%E4%B8%AD%E4%BD%BF%E7%94%A8-pywpsrpc/)

## Usage

You can use this image as a base image for other image

### example

```Dockerfile
FROM akkuman/headless-wps

RUN apt update && apt install libqt5xml5 python3 python3-pip

RUN python3 -m pip --no-cache-dir --no-compile install pywpsrpc

COPY example.py /root/example.py

CMD ["xvfb-run", "python3", "example.py"]
```

## References

- [pywpsrpc](https://github.com/timxx/pywpsrpc)
