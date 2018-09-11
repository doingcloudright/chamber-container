This repo is part of an automated dockerhub <a href="https://hub.docker.com/r/doingcloudright/chamber-container/">build</a>. It builds a Docker image with the
chamber binary installed and can be used later as installation source withing other Dockerfiles.

```
FROM doingcloudright/chamber-container:latest as chamber

FROM alpine:3.8
COPY --from=chamber /shared/chamber /bin/
```
