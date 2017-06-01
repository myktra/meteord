#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "myktra/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "myktra/meteord:node-${NODE_VERSION}-base" myktra/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "myktra/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "myktra/meteord:node-${NODE_VERSION}-onbuild" myktra/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "myktra/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "myktra/meteord:node-${NODE_VERSION}-devbuild" myktra/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "myktra/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "myktra/meteord:node-${NODE_VERSION}-binbuild" myktra/meteord:binbuild
