# verify-env

To compile:

```
DOCKER_BUILDKIT=1 docker build -f Dockerfile-verify-current --rm -t verifyusi/verify-env:current .
```

To publish:
```
docker push verifyusi/verify-env:current
```
