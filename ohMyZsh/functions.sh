#!/bin/bash
function git () {
    (docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git "$@")
}
function docker-compose () {
  DIRNAME=$"$(basename \"$PWD\")"
  docker run --rm -it \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -w "/$DIRNAME" -v "$PWD":"/$DIRNAME":ro \
    docker/compose:1.24.1 "$@"
}
function curl () {
    (docker run --rm --name curl -e http_proxy -e https_proxy pstauffer/curl:latest curl "$@")
}
function wget(){
    (docker run  --rm -e http_proxy -e https_proxy mwendler/wget)
}

$@
