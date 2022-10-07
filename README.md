# verify-env

Docker files for building USI verification group CI images

## Current

To compile:

```
DOCKER_BUILDKIT=1 docker build -f Dockerfile-verify-current --rm -t verifyusi/verify-env:current .
```

To publish:
```
docker push verifyusi/verify-env:current
```

## Starexec

To compile:
```
DOCKER_BUILDKIT=1 docker build -f Dockerfile-verify-starexec --rm -t verifyusi/verify-env:starexec .
```

To publish:
```
docker push verifyusi/verify-env:starexec
```

