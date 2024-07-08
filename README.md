# verify-env

Docker files for building USI verification group CI images

## Current

To compile:

```
DOCKER_BUILDKIT=1 docker build -f Dockerfile-verify-current --rm -t usiverify/verify-env:current .
```

To publish:
```
docker push usiverify/verify-env:current
```

## Fedora

To compile:
```
DOCKER_BUILDKIT=1 docker build -f Dockerfile-verify-fedora --rm -t usiverify/verify-env:fedora .
```

To publish:
```
docker push usiverify/verify-env:fedora
```
