# Headless-WPS

[中文版本](./README_CN.md)

run [wps](https://linux.wps.cn/) in headless docker

## Intro

the base image of this image(`akkuman/headless-wps`) is `debian:bullseye-slim`

[blog article](https://hacktech.cn/2023/08/02/2023-08-02-docker-%E4%B8%AD%E4%BD%BF%E7%94%A8-pywpsrpc/)

If you want to use wine msoffice2010, you can try [docker-msoffice2010-python](https://github.com/akkuman/docker-msoffice2010-python), but after my test, this is not stable enough, and it gets stuck regularly for unknown reasons

## Usage

You can use this image as a base image for other image

### example

look at the [example](example) 

## References

- [pywpsrpc](https://github.com/timxx/pywpsrpc)
