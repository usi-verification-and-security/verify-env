# verify-env

Docker files for building USI verification group CI images.

Use `docker.sh` script to build, push, or run an image.

Example:
```
./docker.sh build current
./docker.sh push current
```

Possible commands are `build`, `push` and `run`.

Possible images are `current`, `fedora`, `ubuntu`, and `archlinux`.

Image `current` is based on `cimg/base:current` which is an image dedicated to CircleCI, making it well suitable for stable CI builds.
However, as a consequence, this image does not provide the latest packages, which may cause troubles in cases such as using `clang-format` where some bugs are fixed only in the latest releases.
