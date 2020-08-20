Cannot install librdkafka on debian

time-drift `apt-get update`

unpriviliged `npm i -g nodemon`

old version of npm and self-signed certificates: `npm i`

check time in UTC:

Run cmd.exe (some problems in git bash): 

```
docker run -it --rm ubuntu:20.04 date --rfc-3339=seconds
2020-08-19 10:57:53+00:00
```

## build-essential vs buildpack-deps

`apt install build-essential`

or

`FROM buildpack-deps:focal`

- https://elegantinfrastructure.com/containers/cotw-buildpack-deps/
- https://github.com/nodejs/docker-node/blob/master/14/buster/Dockerfile

## Sometimes I need to run build again because some problems with network