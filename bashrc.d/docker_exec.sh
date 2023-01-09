#!/bin/bash

function docker_exec() {
  container="${1}"
  shift
  if [ -n "${container}" ]; then
    docker exec -ti $(docker container ls -a | grep "${container}" | awk '{print($1)}') $*
  fi
}
