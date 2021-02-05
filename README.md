tgagor/grype
============

This Docker image provides [Anchore's Grype](https://github.com/anchore/grype) binary so you can use it easily for testing security of Docker images.

You can fetch docker image from:
* [tgagor/grype](https://hub.docker.com/repository/docker/tgagor/grype)
* ghcr.io/tgagor/grype

Beware that image sets `ENTRYPOINT` straight to `grype`.

Usage examples
--------------

### Single execution

If you just want to scan single image:

```
docker run -ti --rm \
    --name grype \
    -v /var/run/docker.sock:/var/run/docker.sock \
    tgagor/grype alpine
```

### Store DB

For scanning of multiple images you might want to save DB in temporary location to avoid re-downloading for each scan:

```
docker run -ti --rm \
    --name grype \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp/db:/var/lib/grype/db \
    tgagor/grype alpine
```
