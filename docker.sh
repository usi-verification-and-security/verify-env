#!/bin/bash

CMDS=(build push run)
IMAGES=(current fedora ubuntu archlinux)

function print_array {
  local -n ary=$1
  [[ -n $2 ]] && local IFS="$2"

  printf "%s\n" "${ary[*]}"
}

function contains {
  local -n ary=$1
  local elem="$2"
  local size=${#ary[@]}
  for (( i=0; $i < $size; i++ )); do
    [[ ${ary[$i]} == $elem ]] && return 0
  done
  return 1
}

function usage {
  printf "USAGE: %s (%s) <image>\n" "$0" $(print_array CMDS '|') >&2
  printf "where <image> is one of: (%s)\n" $(print_array IMAGES '|') >&2
  [[ -n $1 ]] && exit $1
}

contains CMDS "$1" || {
  printf "Unrecognized command: %s\n" "$1" >&2
  usage 1
}
CMD=$1
shift

contains IMAGES "$1" || {
  printf "Unrecognized image: %s\n" "$1" >&2
  usage 1
}
IMAGE=$1
shift

[[ -n $1 ]] && usage 1

IMAGE_FULL=usiverify/verify-env:$IMAGE

case $CMD in
build)
  DOCKER_BUILDKIT=1 docker build -f Dockerfile-verify-$IMAGE --rm -t $IMAGE_FULL .
  ;;

push)
  docker push $IMAGE_FULL
  ;;

run)
  docker run -it $IMAGE_FULL
  ;;

## Should not be reached ...
*)
  printf "Invalid command: %s\n" $CMD >&2
  usage 1
  ;;
esac
