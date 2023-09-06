# Example

This [convertto.py](convertto.py) is from the [pywpsrpc official repository](https://github.com/timxx/pywpsrpc/blob/master/examples/rpcwpsapi/convertto)

## Usage

```shell
docker build -t headless-wps-example .
docker run --rm -v $(pwd):/app/data headless-wps-example --format pdf /app/data/README.md
```
